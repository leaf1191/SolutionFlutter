import 'package:emergency_mate/models/audio_model.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
