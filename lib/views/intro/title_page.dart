import 'package:emergency_mate/firebase/auth/firebase_auth.dart';
import 'package:emergency_mate/viewmodels/intro/intro_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: context.read<IntroViewModel>().exitTapTwice,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: ElevatedButton(
              onPressed: () async {
                try{
                  await auth.signInWithGoogle();
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, '/intro/select');
                } catch(e){
                  Fluttertoast.showToast(msg: '로그인 실패');
                }
              },
              child: const Text('구글 로그인'),
            ),
          ),
        ),
      ),
    );
  }
}
