import 'package:emergency_mate/firebase/auth/firebase_auth.dart';
import 'package:emergency_mate/http/dio.dart';
import 'package:emergency_mate/models/network_model.dart';
import 'package:emergency_mate/viewmodels/intro/intro_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final introViewModel = context.read<IntroViewModel>();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      try{
                        await introViewModel.chooseUserRole(Role.patient);
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamedAndRemoveUntil(context, '/patient/main', ModalRoute.withName('/'));
                      } catch(e){
                        Fluttertoast.showToast(msg: '선택하는데 실패하였습니다.');
                      }
                    },
                    child: const Text('환자')
                ),
                ElevatedButton(
                    onPressed: () async{
                      try{
                        await introViewModel.chooseUserRole(Role.admin);
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamedAndRemoveUntil(context, '/admin/main', ModalRoute.withName('/'));
                      } catch(e){
                        Fluttertoast.showToast(msg: '선택하는데 실패하였습니다.');
                      }
                    },
                    child: const Text('관리')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
