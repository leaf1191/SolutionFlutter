import 'package:audioplayers/audioplayers.dart';

class AudioModel {

  final _path = 'warning.mp3';
  final _player = AudioPlayer();
  PlayerState _state = PlayerState.stopped;

  PlayerState get playerState => _state;

  AudioModel() {
    _setSource();
    //_player.onPlayerStateChanged.listen((event) { print(event); }); 상태 변했을 때 리스너
  }

  _setSource() async{
    await _player.setSource(AssetSource(_path));
    _player.setPlayerMode(PlayerMode.lowLatency);
    _player.setReleaseMode(ReleaseMode.loop);
  }

  playAudio() async{
    await Future.delayed(const Duration(milliseconds: 100)); // 시작하자마자 호출될때 약간의 딜레이(더 좋은 방법 찾아야 함)
    await _player.play(AssetSource(_path));
    _state = PlayerState.playing;
  }

  stopAudio() async{
    await _player.stop();
    _state = PlayerState.stopped;
  }

  clearData(){
    _player.dispose();
  }


}