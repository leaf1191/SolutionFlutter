import 'package:fluttertoast/fluttertoast.dart';

class ExitModel {

  DateTime? _latestTime;
  DateTime? _currentTime;

  Future<bool> exitTapTwice() async {
    _currentTime = DateTime.now();

    if(_latestTime == null || _currentTime!.difference(_latestTime!) > const Duration(seconds: 2)){
      _latestTime = _currentTime!;
      Fluttertoast.showToast(msg: '\'뒤로\' 버튼을 한번 더 누르시면 종료 됩니다.');
      return false;
    } else {
      return true;
    }

  }

}