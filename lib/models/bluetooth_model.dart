import 'dart:async';
import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BluetoothModel {

  late bool _isSupport;
  late StreamSubscription<BluetoothAdapterState> _stateSubscription;
  BluetoothDevice? _currentDevice;

  bool get isSupport => _isSupport;
  BluetoothDevice? get currentDevice => _currentDevice;

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

  Future<bool> blueConnect(BluetoothDevice device) async {
    await _stopScan();
    try{
      await device.connect();
      _currentDevice = device;
      Fluttertoast.showToast(msg: '디바이스 연결 성공');
      return true;
    } catch(e){
      Fluttertoast.showToast(msg: '디바이스 연결 실패');
      return false;
    }
  }

  _startScan() async {
    await FlutterBluePlus.startScan(timeout: const Duration(seconds:5), withNames: ["BT05"]);
    //withNames: ["BT05"]
  }

  _stopScan() async{
    await FlutterBluePlus.stopScan();
  }

  dispose() async {
    await _currentDevice?.disconnect().then((value) => Fluttertoast.showToast(msg: '디바이스 연결 해제'));
    _currentDevice = null;
    _stateSubscription.cancel();
  }

}