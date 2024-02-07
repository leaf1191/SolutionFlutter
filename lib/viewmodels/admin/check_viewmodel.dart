import 'package:flutter/material.dart';

class CheckInfoViewModel extends ChangeNotifier {

  CheckInfoViewModel(this._idx){
    _getUserInfo();
  }

  late final int _idx;
  List? test;

  int get idx => _idx;

  _getUserInfo() async {
    await Future.delayed(Duration(milliseconds: 500));
    test = [];
    notifyListeners();
  }

}