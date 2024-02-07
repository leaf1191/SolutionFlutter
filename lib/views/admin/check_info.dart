import 'package:emergency_mate/viewmodels/admin/check_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckInfo extends StatelessWidget {
  const CheckInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checkViewModel = context.watch<CheckInfoViewModel>();

    if(checkViewModel.test == null){
      return const Scaffold(
        body: SafeArea(
            child: Center(child: CircularProgressIndicator())
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}
