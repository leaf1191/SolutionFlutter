import 'package:fluttertoast/fluttertoast.dart';

class ExitModel {

  DateTime? _latestTime;
  DateTime? _currentTime;

  Future<bool> exitTapTwice() async {
    _currentTime = DateTime.now();

    if(_latestTime == null || _currentTime!.difference(_latestTime!) > const Duration(seconds: 2)){
      _latestTime = _currentTime!;
      Fluttertoast.showToast(msg: '종료하려면 한번더 눌러라');
      return false;
    } else {
      return true;
    }

  }

}