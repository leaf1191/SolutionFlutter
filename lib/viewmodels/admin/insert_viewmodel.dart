import 'package:flutter/material.dart';

class InsertViewModel extends ChangeNotifier {

  final nameCon = TextEditingController();
  final birthCon = TextEditingController();
  final symptomCon = TextEditingController();
  final phoneCon = TextEditingController();
  final parentCon = TextEditingController();

  insertData() {
    print(nameCon.text);
    print(birthCon.text);
    print(symptomCon.text);
    print(phoneCon.text);
    print(parentCon.text);
    Future.delayed(Duration(seconds: 3));
  }

}