import 'package:flutter/material.dart';

class CheckInfoViewModel extends ChangeNotifier {

  CheckInfoViewModel(this._idx){
    print(_idx);
    _getUserInfo();
  }

  late final int _idx;
  List? test;

  _getUserInfo() async {
    await Future.delayed(Duration(milliseconds: 500));
    test = [];
    notifyListeners();
  }

}