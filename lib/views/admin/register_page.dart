import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TextButton(
          onPressed: () { Navigator.pushNamed(context, '/admin/insert'); },
          child: const Text('인서트 페이지로'),
        ),
      ),
    );
  }
}
