import 'package:emergency_mate/models/exit_model.dart';
import 'package:emergency_mate/models/network_model.dart';
import 'package:flutter/material.dart';

class AdminViewModel extends ChangeNotifier {

  // 모델
  final _netWork = NetWorkModel();
  final _exitModel = ExitModel();

  List test = [{'call' : false},{'call' : true},{'call' : false},{'call' : false},{'call' : false},{'call' : false},{'call' : true}];

  // 네트워크 기능
  signOutAndDeleteDB() async => await _netWork.signOutAndDeleteDB();

  // 종료 기능
  Future<bool> exitTapTwice() async => _exitModel.exitTapTwice();


}