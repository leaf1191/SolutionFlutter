import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergency_mate/firebase/auth/firebase_auth.dart';
import 'package:emergency_mate/models/audio_model.dart';
import 'package:emergency_mate/models/bluetooth_model.dart';
import 'package:emergency_mate/models/exit_model.dart';
import 'package:emergency_mate/models/network_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PatientViewModel extends ChangeNotifier {

  BuildContext? _context;
  // 모델
  bool _initComplete = false;
  NetWorkModel? _netWork;
  AudioModel? _audio;
  ExitModel? _exit;
  BluetoothModel? _blue;

  // 파이어스토어 구독
  StreamSubscription? _fireSubscription;

  // 블루투스 데이터
  final List<ScanResult> _blueDevice = [];
  int _blueDeviceLength = 0;
  int? _heartBeat;
  bool _isWarning = false;

  // 게터
  bool get initComplete => _initComplete;
  List<ScanResult> get blueDevice => _blueDevice;
  int get blueDeviceLength => _blueDeviceLength;
  int? get heartBeat => _heartBeat;
  bool get isWarning => _isWarning;

  initModel() {
    _netWork = NetWorkModel();
    _audio = AudioModel();
    _exit = ExitModel();
    _blue = BluetoothModel();
    _setFireStoreSubscription();
    _initComplete = true;
  }
  // context 세터
  setBuildContext(BuildContext context){
    _context = context;
  }

  // api 기능
  signOutAndDeleteDB() async => await _netWork!.signOutAndDeleteDB();

  callByPatient() async{
    try{
      var response = await _netWork!.callByPatient(auth.user?.email);
      if(!response.data){
        Fluttertoast.showToast(msg: '등록이 되어야 이용하실 수 있습니다.');
      }
    } catch(e){
      Fluttertoast.showToast(msg: '호출에 실패하였습니다.');
    }
  }

  // 파이어스토어 구독 관리
  _setFireStoreSubscription(){
    String userUid = auth.user!.uid;
    var fireStream = FirebaseFirestore.instance.collection('wait_patient/$userUid/callCheck').snapshots();
    _fireSubscription = fireStream.listen((event) async {
      if(event.docs.isNotEmpty){
        var callData = event.docs[0].data();
        callData['callPatient']? await _playAudio() : _stopAudio();
        if(callData['callAdmin'] && _context != null){
          Navigator.pushNamedAndRemoveUntil(_context!, '/patient/myTurn', ModalRoute.withName('/'));
        }
      }
    });
  }

  _removeFireStoreSubscription(){
    _fireSubscription?.cancel();
    _fireSubscription = null;
  }

  // 오디오 기능
  _playAudio() async => await _audio!.playAudio();
  _stopAudio() async => await _audio!.stopAudio();

  // 뒤로 두번 누르면 종료
  Future<bool> exitTapTwice() async => await _exit!.exitTapTwice();

  //블루투스
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
    var isConnect = await _blue!.blueConnect(_blueDevice[idx].device);
    if(isConnect){
      await _blueFindServiceAndCharacteristic();
    }
  }

  _blueFindServiceAndCharacteristic() async{
    List<BluetoothService>? services = await _blue!.currentDevice!.discoverServices();
    services.forEach((service) {
      if(service.uuid == Guid('FFE0')){
        List<BluetoothCharacteristic>? characters = service.characteristics;
        characters.forEach((character) async {
          if(character.uuid == Guid('FFE1')) {
            await character.setNotifyValue(true);
            final subscription = character.onValueReceived.listen((value) async {
              String str = String.fromCharCodes(value);
              _heartBeat = int.parse(str);
              notifyListeners();
              // 심박수 40 이하면 호출
              if(_heartBeat != null && (_heartBeat! <= 40 || _heartBeat! >= 120)){
                await callByPatient();
                _isWarning = true;
                notifyListeners();
              } else {
                _isWarning = false;
              }
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
    _isWarning = false;
  }

  // 디스포즈
  clearData() async {
    _netWork = null;
    _removeFireStoreSubscription();
    _audio?.clearData();
    _audio = null;
    _exit = null;
    await _blue?.dispose();
    _blueDataClear();
    _blue = null;
    _initComplete = false;
  }



}