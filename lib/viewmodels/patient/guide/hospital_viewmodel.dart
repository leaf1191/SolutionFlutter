import 'package:flutter/material.dart';

class HospitalViewModel extends ChangeNotifier {

  final floors = ['B2', 'B1', '1F','2F','3F','4F','5F','6F'];
  int? _currentIdx;

  int? get currentIdx => _currentIdx;

  setIndex(int idx){
    _currentIdx = idx;
    notifyListeners();
  }


}