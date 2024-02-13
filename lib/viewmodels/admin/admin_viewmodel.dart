import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergency_mate/models/audio_model.dart';
import 'package:emergency_mate/models/exit_model.dart';
import 'package:emergency_mate/models/network_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminViewModel extends ChangeNotifier {

  AdminViewModel(){
    _setFireStoreSubscription();
  }

  // 모델
  final _netWork = NetWorkModel();
  final _audio = AudioModel();
  final _exitModel = ExitModel();

  // 파이어스토어 구독
  StreamSubscription? _fireSubscription;

  List _waitUsers = [];

  List get waitUsers => _waitUsers;

  // 네트워크 기능
  signOutAndDeleteDB() async => await _netWork.signOutAndDeleteDB();

  callByAdmin(String? gmail) async{
    try{
      await _netWork.callByAdmin(gmail);
    } catch(e){
      Fluttertoast.showToast(msg: '호출하는데 실패하였습니다.');
    }
  }

  deleteUser(String? gmail) async {
    try{
      await _netWork.deleteUserInfo(gmail);
    } catch(e){
      Fluttertoast.showToast(msg: '삭제하는데 실패하였습니다.');
    }
  }

  checkCallByPatient(String? gmail) async{
    try{
      await _netWork.checkCallByPatient(gmail);
    } catch(e){
      Fluttertoast.showToast(msg: '확인에 실패하였습니다.');
    }
  }

  // 파이어스토어 구독 관리
  _setFireStoreSubscription(){
    var fireStream = FirebaseFirestore.instance.collection('wait_patient').orderBy('timestamp').snapshots();
    _fireSubscription = fireStream.listen((event) async {
      _waitUsers = event.docs;

      bool isCall = false;
      for(var user in _waitUsers){
        if(user.data()['callPatient']){
          isCall = true;
          break;
        }
      }
      isCall? await _playAudio() : await _stopAudio();

      notifyListeners();
    });
  }

  _removeFireStoreSubscription(){
    _fireSubscription?.cancel();
    _fireSubscription = null;
  }

  // 오디오 기능
  _playAudio() async => _audio.playAudio();

  _stopAudio() async => _audio.stopAudio();

  // 종료 기능
  Future<bool> exitTapTwice() async => _exitModel.exitTapTwice();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _removeFireStoreSubscription();
    _audio.clearData();
  }


}