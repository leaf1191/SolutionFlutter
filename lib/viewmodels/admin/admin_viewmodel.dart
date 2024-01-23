import 'package:emergency_mate/models/exit_model.dart';
import 'package:flutter/material.dart';

class AdminViewModel extends ChangeNotifier {

  final _exitModel = ExitModel();

  Future<bool> exitTapTwice() async => _exitModel.exitTapTwice();

}