import 'package:emergency_mate/models/audio_model.dart';
import 'package:emergency_mate/models/exit_model.dart';
import 'package:flutter/material.dart';

class PatientViewModel extends ChangeNotifier {

  bool _initComplete = false;
  AudioModel? _audio;
  ExitModel? _exit;

  bool get initComplete => _initComplete;

  initModel() {
    _audio = AudioModel();
    _exit = ExitModel();
    _initComplete = true;
  }

  playAudio() async => _audio!.playAudio();
  stopAudio() async => _audio!.stopAudio();

  Future<bool> exitTapTwice() async => _exit!.exitTapTwice();

  clearData(){
    _audio!.clearData();
    _audio = null;
    _exit = null;
    _initComplete = false;
  }



}