import 'package:flutter/material.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamedAndRemoveUntil(context, '/patient/main', ModalRoute.withName('/'));
                  },
                  child: const Text('환자')
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamedAndRemoveUntil(context, '/admin/main', ModalRoute.withName('/'));
                  },
                  child: const Text('관리')
              )
            ],
          ),
        ),
      ),
    );
  }
}
