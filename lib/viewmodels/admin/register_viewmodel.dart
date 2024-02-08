import 'package:emergency_mate/models/network_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterViewModel extends ChangeNotifier {

  final _netWork = NetWorkModel();

  List? _noWaitList;

  List? get noWaitList => _noWaitList;

  RegisterViewModel(){
    // 전체 미등록 리스트를 받아와야 함
    getAllUserInfo();
  }


  getAllUserInfo() async {
    try{
      var response = await _netWork.getNoWaitList();
      _noWaitList = response.data;
      notifyListeners();
    } catch(e){
      Fluttertoast.showToast(msg: '목록을 가져오는데 실패하였습니다.');
    }
  }

}