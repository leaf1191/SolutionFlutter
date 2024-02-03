import 'package:flutter/material.dart';

enum Gender { male, female}

class InsertViewModel extends ChangeNotifier {

  InsertViewModel() {
    // 미등록 인원 한명의 정보를 받아와야 함
    getUserInfo();
  }

  List? test;
  Gender? _gender;

  Gender? get gender => _gender;

  final nameCon = TextEditingController();
  final birthCon = TextEditingController();
  final symptomCon = TextEditingController();
  final phoneCon = TextEditingController();
  final parentCon = TextEditingController();

  getUserInfo() async {
    await Future.delayed(Duration(milliseconds: 500));
    test = [];
    notifyListeners();
  }

  insertData() async{
    print(nameCon.text);
    print(birthCon.text);
    print(symptomCon.text);
    print(phoneCon.text);
    print(parentCon.text);
    await Future.delayed(Duration(milliseconds: 500));
  }

  setGender(Gender? value){
    _gender = value;
    notifyListeners();
  }

}