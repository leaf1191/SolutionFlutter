import 'package:fluttertoast/fluttertoast.dart';

class ExitModel {

  DateTime? latestTime;
  DateTime? currentTime;

  Future<bool> exitTapTwice() async {
    currentTime = DateTime.now();

    if(latestTime == null || currentTime!.difference(latestTime!) > const Duration(seconds: 2)){
      latestTime = currentTime!;
      Fluttertoast.showToast(msg: '종료하려면 한번더 눌러라');
      return false;
    } else {
      return true;
    }

  }

}