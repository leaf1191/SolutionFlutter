import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {

  RegisterViewModel(){
    // 전체 미등록 리스트를 받아와야 함
    getAllUserInfo();
  }

  List? test;

  getAllUserInfo() async {
    await Future.delayed(Duration(milliseconds: 500));
    test = [1,2,3,4,5];
    notifyListeners();
  }

  testFunction(){
    test!.add(5);
    notifyListeners();
  }


}