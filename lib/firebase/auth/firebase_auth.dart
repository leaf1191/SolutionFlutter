import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final auth = Auth();

class Auth {

  static final _instance = Auth._internal();
  final _fireInstance = FirebaseAuth.instance;
  User? _user;
  late bool _hasUser;
  late StreamSubscription<User?> _listener;
  
  User? get user => _user;
  bool get hasUser => _hasUser;

  factory Auth(){
    return _instance;
  }

  Auth._internal(){
    setStateListener();
  }

  setStateListener() {
    _listener = _fireInstance.idTokenChanges().listen((user) {
      if(user == null){
        _hasUser = false;
        _user = null;
        print('유저 없음');
      } else {
        _hasUser = true;
        _user = user;
        print(_user);
      }
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await _fireInstance.signInWithCredential(credential);
  }

  signOut() async{
    await GoogleSignIn().disconnect();
    await _fireInstance.signOut();
  }


  dispose(){
    _listener.cancel();
  }

}