import 'dart:async';
import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BluetoothModel {

  late bool _isSupport;
  late StreamSubscription<BluetoothAdapterState> _stateSubscription;

  bool get isSupport => _isSupport;

  BluetoothModel(){
    blueSetting();
  }

  blueSetting() async{
    _isSupport = await FlutterBluePlus.isSupported;
    if (!_isSupport) {
      Fluttertoast.showToast(msg: '지원하지 않는 기기입니다.');
      return;
    }

    // 블루투스 온 오프 파악
    _stateSubscription = FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
      print(state);
      if (state == BluetoothAdapterState.on) {
        print('스테이트온');
      } else {
        print('스테이트 온 상태 아님');
      }
    });

    // 안드로이드는 자체적으로 온오프 불가
    if (Platform.isAndroid) {
      await FlutterBluePlus.turnOn();
    }

  }

  blueScan() async {
    // 블루투스 켜져있으면 작업 진행
    await FlutterBluePlus.adapterState.where((val) => val == BluetoothAdapterState.on).first;

    await _startScan();

  }

  blueConnect(BluetoothDevice device) async {
    await device.connect();
  }

  _startScan() async {
    await FlutterBluePlus.startScan(timeout: const Duration(seconds:15));
  }

  stopScan() async{
    await FlutterBluePlus.stopScan();
  }

  dispose(){
    _stateSubscription.cancel();
  }

}