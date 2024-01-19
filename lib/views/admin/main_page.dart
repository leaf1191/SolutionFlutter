import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('admin.main');
    return Scaffold(
      body: SafeArea(
        child: IconButton(
          onPressed: () { Navigator.pushNamed(context, '/admin/insert'); },
          icon: const Icon(Icons.add_box_outlined),
        ),
      ),
    );
  }
}
