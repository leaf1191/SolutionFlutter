import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/viewmodels/patient/patient_viewmodel.dart';
import 'package:emergency_mate/widgets/app_bar.dart';
import 'package:emergency_mate/widgets/basic_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeartPage extends StatelessWidget {
  const HeartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final patientViewModel = context.watch<PatientViewModel>();

    final color = patientViewModel.isWarning? WARNING_COLOR : MAIN_COLOR;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: patientViewModel.isWarning? const AssetImage('assets/heart/red_background_img.jpg') : const AssetImage('assets/background_img.jpg'),
                  fit: BoxFit.fill
              )
          ),
          child: Column(
            children: [
              SizedBox(height: 60,child: BackAppBar(back: 'Home',title: '건강데이터',color: color,)),
              const Expanded(child: Center(child: Text('실시간 맥박수',style: TextStyle(fontSize: 20),),)),
              Expanded(flex: 2,child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(40, 50, 40, 0),
                    child: BasicButton(
                      width: double.infinity,
                      height: double.infinity,
                      color: color,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${patientViewModel.heartBeat ?? '-'}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 50),),
                          Text('  BPM',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: color),)
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                        height: 100,
                        child: patientViewModel.isWarning? Image.asset('assets/heart/red_heart.png') : Image.asset('assets/heart/blue_heart.png')
                    ),
                  ),
                ],
              )),
              Expanded(flex: 2,child: Center(
                child: GestureDetector(
                  onTap: () async {
                    await patientViewModel.blueScan();
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, '/patient/device');
                  },
                  child: BasicButton(
                    width: 120,
                    height: 120,
                    color: color,
                    circular: 40,
                    child: Column(
                      children: [
                        Expanded(flex: 2,child: Container(
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                          child: patientViewModel.isWarning? Image.asset('assets/heart/redtooth.png') : Image.asset('assets/heart/bluetooth.png'),
                        )),
                        Expanded(child: Text('블루투스 연결',style: TextStyle(color: color,fontWeight: FontWeight.bold),))
                      ],
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}