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

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background_img.jpg'),
                  fit: BoxFit.fill
              )
          ),
          child: Column(
            children: [
              const SizedBox(height: 60,child: BackAppBar(back: 'Home',title: '건강데이터',color: MAIN_COLOR,)),
              const Expanded(child: Center(child: Text('실시간 맥박수',style: TextStyle(fontSize: 20),),)),
              Expanded(flex: 2,child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(40, 50, 40, 0),
                    child: BasicButton(
                      width: double.infinity,
                      height: double.infinity,
                      color: MAIN_COLOR,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${patientViewModel.heartBeat ?? '-'}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),),
                          const Text('  BPM',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: MAIN_COLOR),)
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                        height: 100,
                        child: Image.asset('assets/heart/blue_heart.png')
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
                    color: MAIN_COLOR,
                    circular: 40,
                    child: Column(
                      children: [
                        Expanded(flex: 2,child: Container(
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                          child: Image.asset('assets/heart/bluetooth.png'),
                        )),
                        const Expanded(child: Text('블루투스 연결',style: TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold),))
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

/*
Column(
          children: [
            const SizedBox(
                height: 60,
                child: BackAppBar(title: '건강데이터',back: 'Home',color: MAIN_COLOR,)
            ),
            Text('${provider.heartBeat ?? '값 없음'}'),
            ElevatedButton(onPressed: () async {
              await provider.blueScan();
            }, child: Text('그냥 테스트 버튼')),
            Expanded(
                child: ListView.builder(
                    itemCount: provider.blueDeviceLength,
                    itemBuilder: (context, i){
                      return GestureDetector(
                        onTap: () async {
                          await provider.blueConnect(i);
                        },
                        child: BasicButton(
                            width: double.infinity,
                            height: 200,
                            child: Text('${provider.blueDevice[i]}')
                        ),
                      );
                    }
                ),
            ),
          ],
        )
 */
