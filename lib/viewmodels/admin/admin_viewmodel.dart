import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergency_mate/models/exit_model.dart';
import 'package:emergency_mate/models/network_model.dart';
import 'package:flutter/material.dart';

class AdminViewModel extends ChangeNotifier {

  AdminViewModel(){
    _setFireStoreSubscription();
  }

  // 모델
  final _netWork = NetWorkModel();
  final _exitModel = ExitModel();

  // 파이어스토어 구독
  StreamSubscription? _fireSubscription;

  List test = [{'call' : false},{'call' : true},{'call' : false},{'call' : false},{'call' : false},{'call' : false},{'call' : true}];

  // 네트워크 기능
  signOutAndDeleteDB() async => await _netWork.signOutAndDeleteDB();

  // 파이어스토어 구독 관리
  _setFireStoreSubscription(){
    var fireStream = FirebaseFirestore.instance.collection('wait_patient').snapshots();
    _fireSubscription = fireStream.listen((event) async {
      print(event.docs);
    });
  }

  _removeFireStoreSubscription(){
    _fireSubscription?.cancel();
    _fireSubscription = null;
  }

  // 종료 기능
  Future<bool> exitTapTwice() async => _exitModel.exitTapTwice();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _removeFireStoreSubscription();
  }


}