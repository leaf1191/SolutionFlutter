import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/models/network_model.dart';
import 'package:emergency_mate/viewmodels/intro/intro_viewmodel.dart';
import 'package:emergency_mate/widgets/app_bar.dart';
import 'package:emergency_mate/widgets/basic_button.dart';
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
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background_img.jpg'),
                    fit: BoxFit.fill
                )
            ),
            child: Column(
              children: [
                const SizedBox(height: 60,child: BasicAppBar(
                  title: '유형 선택',
                )),
                const Expanded(child: Align(alignment: Alignment.bottomCenter,child: Text('이용하시는 역할 유형을\n        선택해주세요.',style: TextStyle(fontSize: 20),))),
                Expanded(flex: 3,
                  child: GestureDetector(
                    onTap: () async {
                      try{
                        await introViewModel.chooseUserRole(Role.patient);
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamedAndRemoveUntil(context, '/patient/main', ModalRoute.withName('/'));
                      } catch(e){
                        Fluttertoast.showToast(msg: '선택하는데 실패하였습니다.');
                      }
                    },
                    child: Container(
                        margin: const EdgeInsets.all(30),
                        child: BasicButton(
                          width: double.infinity,
                          height: double.infinity,
                          color: MAIN_COLOR,
                          child: Column(
                            children: [
                              Expanded(flex: 3,child: Container(
                                margin: const EdgeInsets.fromLTRB(35, 35, 35, 0),
                                child: Image.asset('assets/select/patient.png'),
                              )),
                              const Expanded(flex: 2,child: Text('환자',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: MAIN_COLOR),))
                            ],
                          ),
                        ),
                                    ),
                  ),),
                Expanded(flex: 3,
                  child: GestureDetector(
                    onTap: () async {
                      try{
                        await introViewModel.chooseUserRole(Role.admin);
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamedAndRemoveUntil(context, '/admin/main', ModalRoute.withName('/'));
                      } catch(e){
                        Fluttertoast.showToast(msg: '선택하는데 실패하였습니다.');
                      }
                    },
                    child: Container(
                    margin: const EdgeInsets.all(30),
                    child: BasicButton(
                      width: double.infinity,
                      height: double.infinity,
                      color: MAIN_COLOR,
                      child: Column(
                        children: [
                          Expanded(flex: 3,child: Container(
                            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Image.asset('assets/select/admin.png'),
                          )),
                          const Expanded(flex: 2,child: Text('관리자',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: MAIN_COLOR),))
                        ],
                      ),
                    ),
                                    ),
                  ),),
                const Expanded(child: SizedBox()), // 비율 조정
              ],
            ),
          ),
        ),
      ),
    );
  }
}

