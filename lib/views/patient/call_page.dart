import 'dart:async';

import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/viewmodels/patient/patient_viewmodel.dart';
import 'package:emergency_mate/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final patientViewModel = context.read<PatientViewModel>();
    Timer? timer;

    return Scaffold(
      backgroundColor: WARNING_COLOR,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
                height: 60,
                child: BackAppBar(back: 'Home',title: '긴급 호출',color: WARNING_COLOR,)
            ),
            const Expanded(
                child: Center(child: Text('의료진 호출버튼',style: TextStyle(color: Colors.white,fontSize: 18),))
            ),
            Expanded(
                flex: 3,
                child: GestureDetector(
                  onLongPressStart: (details) {
                    int i = 0;
                    timer = Timer.periodic(const Duration(milliseconds: 700), (timer) async {
                      if(i++ == 1){
                        await patientViewModel.callByPatient();
                      }
                    });
                  },
                  onLongPressEnd: (details){
                    timer?.cancel();
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 5),
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10
                        ),
                      ]
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 40,),
                        Expanded(
                            flex: 2,
                            child: Container(
                                margin: const EdgeInsets.all(30),
                                child: Image.asset('assets/call/sos.png')
                            ),
                        ),
                        const Expanded(
                            child: Text('3초 간 눌러주세요.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: WARNING_COLOR),)
                        ),
                      ],
                    ),
                  ),
                ),
            ),
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 50,
                        child: Image.asset('assets/call/caution.png')
                    ),
                    const SizedBox(width: 5,),
                    const Text('의료진의 도움이 필요한\n긴급 시에만 눌러주세요.',style: TextStyle(fontSize: 18,color: Colors.white),)
                  ],
                )
            ),
            const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
