import 'package:emergency_mate/viewmodels/intro/intro_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: context.read<IntroViewModel>().exitTapTwice,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/intro/select');
              },
              child: const Text('로그인'),
            ),
          ),
        ),
      ),
    );
  }
}
