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

    if(checkViewModel.userInfo == null){
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
                            child: Align(alignment: Alignment.topLeft,child: Text('대기번호 ${checkViewModel.idx + 1}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),))
                        )),
                        const Expanded(child: Text('이름',style: TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold,fontSize: 20),)),
                        Expanded(child: Text('${checkViewModel.userInfo!['name']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                        Expanded(child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(child: Column(
                                children: [
                                  const Expanded(child: Text('생년월일',style: TextStyle(color: MAIN_COLOR,fontSize: 20,fontWeight: FontWeight.bold),)),
                                  Expanded(child: Text('${checkViewModel.userInfo!['date']}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                ],
                              )),
                              Container(margin: const EdgeInsets.symmetric(vertical: 10),child: const VerticalDivider()),
                              Expanded(child: Column(
                                children: [
                                  const Expanded(child: Text('성별',style: TextStyle(color: MAIN_COLOR,fontSize: 20,fontWeight: FontWeight.bold),)),
                                  Expanded(child: Text('${checkViewModel.userInfo!['gender']}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                ],
                              )),
                            ],
                          ),
                        )),
                      ],
                    )),
                    Expanded(child: Container(
                      margin: const EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Expanded(child: Row(
                            children: [
                              const Text('증상',style: TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold,fontSize: 15),),
                              const SizedBox(width: 5,),
                              Text('${checkViewModel.userInfo!['symptom']}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            ],
                          )),
                          Expanded(child: Row(
                            children: [
                              const Text('혈액형',style: TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold,fontSize: 15),),
                              const SizedBox(width: 5,),
                              Text('${checkViewModel.userInfo!['bloodType']}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            ],
                          )),
                          Expanded(child: Row(
                            children: [
                              const Text('이메일',style: TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold,fontSize: 15),),
                              const SizedBox(width: 5,),
                              Text('${checkViewModel.userInfo!['email']}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            ],
                          )),
                          Expanded(child: Row(
                            children: [
                              const Text('연락처',style: TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold,fontSize: 15),),
                              const SizedBox(width: 5,),
                              Text('${checkViewModel.userInfo!['phoneNum']}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            ],
                          )),
                          Expanded(child: Row(
                            children: [
                              const Text('보호자 연락처',style: TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold,fontSize: 15),),
                              const SizedBox(width: 5,),
                              Text('${checkViewModel.userInfo!['phoneNum2']}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
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
