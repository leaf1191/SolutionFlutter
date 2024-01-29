import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class WaitPage extends StatelessWidget {
  const WaitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: BackAppBar(
                back: 'Home',
                title: '대기 확인',
                color: MAIN_COLOR,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
