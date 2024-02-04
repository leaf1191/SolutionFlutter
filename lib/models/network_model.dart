import 'package:emergency_mate/firebase/auth/firebase_auth.dart';
import 'package:emergency_mate/http/dio.dart';
import 'package:flutter/material.dart';

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



}