import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/viewmodels/admin/check_viewmodel.dart';
import 'package:emergency_mate/widgets/app_bar.dart';
import 'package:emergency_mate/widgets/basic_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckInfo extends StatelessWidget {
  const CheckInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checkViewModel = context.watch<CheckInfoViewModel>();

    if(checkViewModel.test == null){
      return const Scaffold(
        body: SafeArea(
            child: Center(child: CircularProgressIndicator())
        ),
      );
    }
    return Scaffold(
      backgroundColor: const Color(0xffEAF5FA),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60, child: BackAppBar(back: '',title: '환자 정보',color: MAIN_COLOR,),),
            const Expanded(flex: 2,child: Center(child: Text('환자 정보',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),)),
            Expanded(flex: 6,child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: BasicButton(
                width: double.infinity,
                height: double.infinity,
                color: MAIN_COLOR,
                child: Column(
                  children: [
                    Expanded(child: Column(
                      children: [
                        Expanded(child: Container(
                            margin: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                            child: Align(alignment: Alignment.topLeft,child: Text('대기번호 ${checkViewModel.idx + 1}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),))
                        )),
                        const Expanded(child: Text('이름',style: TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold,fontSize: 20),)),
                        const Expanded(child: Text('김정은',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                        Expanded(child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const Expanded(child: Column(
                                children: [
                                  Expanded(child: Text('생년월일',style: TextStyle(color: MAIN_COLOR,fontSize: 20,fontWeight: FontWeight.bold),)),
                                  Expanded(child: Text('24.02.03',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                ],
                              )),
                              Container(margin: const EdgeInsets.symmetric(vertical: 10),child: const VerticalDivider()),
                              const Expanded(child: Column(
                                children: [
                                  Expanded(child: Text('성별',style: TextStyle(color: MAIN_COLOR,fontSize: 20,fontWeight: FontWeight.bold),)),
                                  Expanded(child: Text('남',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                ],
                              )),
                            ],
                          ),
                        )),
                      ],
                    )),
                    Expanded(child: Container(
                      margin: const EdgeInsets.all(30),
                      child: const Column(
                        children: [
                          Expanded(child: Row(
                            children: [
                              Text('증상',style: TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold,fontSize: 15),),
                              SizedBox(width: 5,),
                              Text('정신병',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            ],
                          )),
                          Expanded(child: Row(
                            children: [
                              Text('혈액형',style: TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold,fontSize: 15),),
                              SizedBox(width: 5,),
                              Text('B',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            ],
                          )),
                          Expanded(child: Row(
                            children: [
                              Text('이메일',style: TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold,fontSize: 15),),
                              SizedBox(width: 5,),
                              Text('구글의@주어진.이메일',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            ],
                          )),
                          Expanded(child: Row(
                            children: [
                              Text('연락처',style: TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold,fontSize: 15),),
                              SizedBox(width: 5,),
                              Text('010-1234-5678',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            ],
                          )),
                          Expanded(child: Row(
                            children: [
                              Text('보호자 연락처',style: TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold,fontSize: 15),),
                              SizedBox(width: 5,),
                              Text('010-8765-4321',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            ],
                          )),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            )),
            const Expanded(child: SizedBox()), // 비율 조정용
          ],
        ),
      ),
    );
  }
}
