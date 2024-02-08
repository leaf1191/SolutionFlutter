import 'package:dio/dio.dart';
import 'package:emergency_mate/firebase/auth/firebase_auth.dart';
import 'package:emergency_mate/http/dio.dart';

enum Role { patient, admin}

class NetWorkModel {

  signInWithGoogle() async {
    await auth.signInWithGoogle();
    // 로그인이 되면 디비에 유저 생성
    dio.options.headers['Authorization'] = await auth.user?.getIdToken();
    await dio.get(addUser);
  }

  signOutAndDeleteDB() async {
    // 디비에서 데이터 제거
    dio.options.headers['Authorization'] = await auth.user?.getIdToken();
    await dio.get(deleteUser);
    // 로그아웃
    await auth.signOut();
  }

  chooseUserRole(Role? role) async{
    dio.options.headers['Authorization'] = await auth.user?.getIdToken();
    if(role == Role.patient){
      await dio.get(toPatient);
    } else {
      await dio.get(toAdmin);
    }
  }

  Future<Response> getNoWaitList() async{
    dio.options.headers['Authorization'] = await auth.user?.getIdToken();
    return await dio.get(getNoWait);
  }



}