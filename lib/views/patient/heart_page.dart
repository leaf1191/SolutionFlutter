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
    final provider = context.watch<PatientViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
                height: 60,
                child: BackAppBar(title: '건강데이터',back: 'Home',color: MAIN_COLOR,)
            ),
            const Text('심박수 정보'),
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
        ),
      ),
    );
  }
}
