import 'dart:async';

import 'package:emergency_mate/models/audio_model.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer? timer;
    final model = AudioModel();
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async{
                    await model.playAudio();
                  },
                  child: const Text('재생')
              ),
              GestureDetector(
                onTap: (){
                  print('그냥 탭');
                },
                onLongPressStart: (details){
                  int i = 0;
                  timer = Timer.periodic(const Duration(milliseconds: 1000),
                    (timer) async {
                  if (i++ == 2) {
                    await model.playAudio();
                  }
                });
              },
                onLongPressEnd: (details){
                  timer?.cancel();
                },
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xffeed9f7),
                  ),
                  child: const Center(child: Text('롱 재생')),
                ),
              ),
              ElevatedButton(
                  onPressed: () async{
                    await model.stopAudio();
                  },
                  child: const Text('정지')
              ),
            ],
          ),
        )
      ),
    );
  }
}
