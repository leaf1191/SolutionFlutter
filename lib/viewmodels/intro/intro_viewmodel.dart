import 'package:emergency_mate/firebase/auth/firebase_auth.dart';
import 'package:emergency_mate/http/dio.dart';
import 'package:emergency_mate/models/exit_model.dart';
import 'package:emergency_mate/models/network_model.dart';
import 'package:flutter/material.dart';

class IntroViewModel extends ChangeNotifier {

  final _netWorkModel = NetWorkModel();
  final _exitModel = ExitModel();


  Future<bool> exitTapTwice() async => _exitModel.exitTapTwice();

  signInWithGoogle() async => await _netWorkModel.signInWithGoogle();

  chooseUserRole(String str) async{

  }


}