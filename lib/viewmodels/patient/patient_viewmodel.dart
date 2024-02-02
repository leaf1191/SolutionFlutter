import 'package:emergency_mate/models/audio_model.dart';
import 'package:emergency_mate/models/bluetooth_model.dart';
import 'package:emergency_mate/models/exit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PatientViewModel extends ChangeNotifier {

  bool _initComplete = false;
  AudioModel? _audio;
  ExitModel? _exit;
  BluetoothModel? _blue;

  final List<ScanResult> _blueDevice = [];
  int _blueDeviceLength = 0;
  int? _heartBeat;

  bool get initComplete => _initComplete;
  List<ScanResult> get blueDevice => _blueDevice;
  int get blueDeviceLength => _blueDeviceLength;
  int? get heartBeat => _heartBeat;

  initModel() {
    _audio = AudioModel();
    _exit = ExitModel();
    _blue = BluetoothModel();
    _initComplete = true;
  }

  playAudio() async => await _audio!.playAudio();
  stopAudio() async => await _audio!.stopAudio();

  Future<bool> exitTapTwice() async => await _exit!.exitTapTwice();

  blueSetting() async => await _blue!.blueSetting();
  blueScan() async {
    if (!_blue!.isSupport) {
      Fluttertoast.showToast(msg: '지원하지 않는 기기입니다.');
      return;
    }
    var subscription = FlutterBluePlus.onScanResults.listen((results) {
      if (results.isNotEmpty) {
        var result = results.last;
        _blueDevice.add(result);
        _blueDeviceLength = _blueDevice.length;
        notifyListeners();
      }
    },
      onError: (e) => print(e),
    );
    // 스캔 다되면 종료
    FlutterBluePlus.cancelWhenScanComplete(subscription);

    _blueDevice.clear();
    _blueDeviceLength = 0;
    await _blue!.blueScan();

  }

  blueConnect(int idx) async {
    await _blue!.blueConnect(_blueDevice[idx].device);
    await _blueFindServiceAndCharacteristic();
  }

  _blueFindServiceAndCharacteristic() async{
    List<BluetoothService>? services = await _blue!.currentDevice!.discoverServices();
    services.forEach((service) {
      if(service.uuid == Guid('FFE0')){
        List<BluetoothCharacteristic>? characters = service.characteristics;
        characters.forEach((character) async {
          if(character.uuid == Guid('FFE1')) {
            await character.setNotifyValue(true);
            final subscription = character.onValueReceived.listen((value) {
              String str = String.fromCharCodes(value);
              _heartBeat = int.parse(str);
              notifyListeners();
            });
            _blue!.currentDevice!.cancelWhenDisconnected(subscription);
          }
        });
      }
    });
  }

  _blueDataClear(){
    _blueDevice.clear();
    _blueDeviceLength = 0;
    _heartBeat = null;
  }


  clearData(){
    _audio!.clearData();
    _audio = null;
    _exit = null;
    _blue!.dispose();
    _blueDataClear();
    _blue = null;
    _initComplete = false;
  }



}