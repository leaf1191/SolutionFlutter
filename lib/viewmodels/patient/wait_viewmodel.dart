import 'package:emergency_mate/models/network_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WaitViewModel extends ChangeNotifier {

  WaitViewModel(){
    _getMyInfo();
  }

  final _netWork = NetWorkModel();

  late bool _isWait;
  Map? _myInfo;
  int? _waitNum;

  bool get isWait => _isWait;
  Map? get myInfo => _myInfo;
  int? get waitNum => _waitNum;

  _getMyInfo() async{
    try{
      var responseInfo = await _netWork.getMyInfo();
      var responseNum = await _netWork.getMyWaitNum();
      _myInfo = responseInfo.data;
      _waitNum = responseNum.data;

      _isWait = !(_waitNum == -1);
      notifyListeners();
    } catch(e){
      Fluttertoast.showToast(msg: '정보를 불러오는데 실패했습니다.');
    }
  }

}