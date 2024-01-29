import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class HeartPage extends StatelessWidget {
  const HeartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
                height: 60,
                child: BackAppBar(title: '건강데이터',back: 'Home',color: MAIN_COLOR,)
            ),
          ],
        ),
      ),
    );
  }
}
