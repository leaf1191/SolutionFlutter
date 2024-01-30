import 'package:emergency_mate/models/audio_model.dart';
import 'package:flutter/material.dart';

class PatientViewModel extends ChangeNotifier {

  bool _initComplete = false;
  late final AudioModel _audio;

  bool get initComplete => _initComplete;

  initModel() {
    _audio = AudioModel();
    _initComplete = true;
  }

  playAudio() async => _audio.playAudio();
  stopAudio() async => _audio.stopAudio();



}