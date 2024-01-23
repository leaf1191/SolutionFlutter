import 'package:emergency_mate/viewmodels/admin/admin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: context.read<AdminViewModel>().exitTapTwice,
      child: Scaffold(
        body: SafeArea(
          child: IconButton(
            onPressed: () { Navigator.pushNamed(context, '/admin/register'); },
            icon: const Icon(Icons.add_box_outlined),
          ),
        ),
      ),
    );
  }
}
