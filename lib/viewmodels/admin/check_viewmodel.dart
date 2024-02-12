import 'package:emergency_mate/models/network_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckInfoViewModel extends ChangeNotifier {

  CheckInfoViewModel(this._gmail, this._idx){
    _getUserInfo();
  }

  final _netWork = NetWorkModel();

  late final int _idx;
  late final String? _gmail;
  Map? _userInfo;

  int get idx => _idx;
  String? get gmail => _gmail;
  Map? get userInfo => _userInfo;

  _getUserInfo() async {
    try{
      var response = await _netWork.getWaitUserInfo(_gmail);
      _userInfo = response.data;
      notifyListeners();
    } catch(e){
      Fluttertoast.showToast(msg: '유저 정보를 불러오는 데 실패하였습니다.');
    }
  }

}