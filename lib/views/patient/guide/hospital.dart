import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class GuideHospital extends StatelessWidget {
  const GuideHospital({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
                height: 60,
                child: BackAppBar(title: '병원 안내',back: 'Home',color: MAIN_COLOR,)
            ),
          ],
        ),
      ),
    );
  }
}