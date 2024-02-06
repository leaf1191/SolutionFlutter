import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/viewmodels/patient/patient_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class MyTurn extends StatelessWidget {
  const MyTurn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final patientViewModel = context.read<PatientViewModel>();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background_img.jpg'),
                    fit: BoxFit.fill
                )
            ),
            child: Stack(
              children: [
                const Center(child: Text('        고객님,\n차례가 되었습니다!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () async {
                      try{
                        await patientViewModel.signOutAndDeleteDB();
                        await patientViewModel.clearData();
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamedAndRemoveUntil(context, '/intro/title', ModalRoute.withName('/'));
                      }catch(e){
                        Fluttertoast.showToast(msg: '로그아웃 실패');
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      margin: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: MAIN_COLOR,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: const Center(child: Text('로그아웃', style: TextStyle(color: Colors.white),),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
