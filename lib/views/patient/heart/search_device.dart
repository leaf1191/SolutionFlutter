import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/viewmodels/patient/patient_viewmodel.dart';
import 'package:emergency_mate/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchDevice extends StatelessWidget {
  const SearchDevice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final patientViewModel = context.watch<PatientViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xffEAF5FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60,child: BackAppBar(back: '',title: '블루투스 연결',color: MAIN_COLOR,)),
            Expanded(flex: 2,child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: Center(child: Image.asset('assets/heart/bluetooth.png')),
            )),
            const Expanded(flex: 2,child: Center(child: Text('연결하는 디바이스가 등록 가능한 지\n확인하세요.',style: TextStyle(color: MAIN_COLOR, fontSize: 15,fontWeight: FontWeight.bold),),)),
            Expanded(child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text('등록된 디바이스',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            )),
            Expanded(flex: 12,child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 5),
                      color: Colors.grey.withOpacity(0.8),
                      blurRadius: 3
                  ),
                ]
              ),
              child: ListView.separated(
                  itemCount: patientViewModel.blueDeviceLength,
                  itemBuilder: (context, i){
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(child: Container(
                              margin: const EdgeInsets.all(8),
                              child: Image.asset('assets/heart/device.png')
                          )),
                          Expanded(flex: 4,child: Text('${patientViewModel.blueDevice[i].device.platformName}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
                          Container(margin: const EdgeInsets.symmetric(vertical: 10),child: const VerticalDivider()),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () async{
                                    await patientViewModel.blueConnect(i);
                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context);
                                  },
                                  child: Container(margin: const EdgeInsets.all(1),child: Image.asset('assets/heart/connect.png'))
                              ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, i){
                    return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        child: const Divider()
                    );
                  },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
