import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:emergency_mate/firebase/auth/firebase_auth.dart';
import 'package:emergency_mate/http/dio.dart';

enum Role { patient, admin}

class NetWorkModel {

  // 로그인 기능
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

  // 환자 관리자 선택
  chooseUserRole(Role? role) async{
    dio.options.headers['Authorization'] = await auth.user?.getIdToken();
    if(role == Role.patient){
      await dio.get(toPatient);
    } else {
      await dio.get(toAdmin);
    }
  }

  // 환자 정보 겟
  Future<Response> getMyInfo() async {
    dio.options.headers['Authorization'] = await auth.user?.getIdToken();
    return await dio.get(getUser);
  }

  Future<Response> getMyWaitNum() async {
    dio.options.headers['Authorization'] = await auth.user?.getIdToken();
    return await dio.get(getWaitNum);
  }

  Future<Response> callByPatient(String? gmail) async{
    dio.options.headers['Authorization'] = await auth.user?.getIdToken();
    return await dio.get('$callPatient/$gmail');
  }

  // 미등록 유저
  Future<Response> getNoWaitList() async{
    dio.options.headers['Authorization'] = await auth.user?.getIdToken();
    return await dio.get(getNoWait);
  }

  Future<Response> getNoWaitUserInfo(String? gmail) async{
    dio.options.headers['Authorization'] = await auth.user?.getIdToken();
    return await dio.get('/list/$gmail');
  }

  postUserInfo(Map data, String gmail) async{
    dio.options.headers['Authorization'] = await auth.user?.getIdToken();
    String jsonData = json.encode(data);
    await dio.post('$postInfo/$gmail',data: jsonData);
  }

  // 등록 유저
  Future<Response> getWaitUserInfo(String? gmail) async{
    dio.options.headers['Authorization'] = await auth.user?.getIdToken();
    return await dio.get('$getWait/$gmail');
  }

  callByAdmin(String? gmail) async{
    dio.options.headers['Authorization'] = await auth.user?.getIdToken();
    await dio.get('$callAdmin/$gmail');
  }

  deleteUserInfo(String? gmail) async {
    dio.options.headers['Authorization'] = await auth.user?.getIdToken();
    await dio.get('$deleteUser/$gmail');
  }

  checkCallByPatient(String? gmail) async{
    dio.options.headers['Authorization'] = await auth.user?.getIdToken();
    await dio.get('$callOffPatient/$gmail');
  }


}