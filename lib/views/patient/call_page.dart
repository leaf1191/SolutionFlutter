/*
GestureDetector(
                onTap: (){
                  print('그냥 탭');
                },
                onLongPressStart: (details){
                  int i = 0;
                  timer = Timer.periodic(const Duration(milliseconds: 1000),
                    (time) async {
                  if (i++ == 1) {
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
 */
import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
                height: 60,
                child: BackAppBar(back: 'Home',title: '긴급 호출',color: WARNING_COLOR,)
            ),
          ],
        ),
      ),
    );
  }
}
