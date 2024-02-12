import 'package:dio/dio.dart';
import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/viewmodels/admin/insert_viewmodel.dart';
import 'package:emergency_mate/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InsertInfo extends StatelessWidget {
  const InsertInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final insertViewModel = context.read<InsertViewModel>();
    final watchInsert = context.watch<InsertViewModel>();

    if(watchInsert.userInfo == null){
      return const Scaffold(
        body: SafeArea(
            child: Center(child: CircularProgressIndicator())
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 850,
            child: Form(
              key: insertViewModel.key,
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                    child: BasicAppBar(title: '상세 정보',),
                  ),
                  // 최상단
                  Expanded(child: Container(
                    margin: const EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(child: Align(alignment: Alignment.bottomLeft,child: Text('이메일',style: TextStyle(fontWeight: FontWeight.bold,color: MAIN_COLOR),))),
                        Expanded(child: Align(alignment: Alignment.centerLeft,child: Text('${watchInsert.userInfo?['email']}',style: const TextStyle(fontWeight: FontWeight.bold),))),
                        const Expanded(child: Align(alignment: Alignment.bottomLeft,child: Text('이름',style: TextStyle(fontWeight: FontWeight.bold,color: MAIN_COLOR),))),
                        Expanded(child: SizedBox(
                          width: 100,
                          child: TextFormField(
                            controller: insertViewModel.nameCon,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: const TextStyle(fontSize: 15, height: 1),
                            validator: insertViewModel.validate,
                            decoration: const InputDecoration(
                                hintText: '이름',
                                border: OutlineInputBorder(),
                                errorStyle: TextStyle(fontSize: 0)
                            ),
                          ),
                        )),
                        const Expanded(child: Align(alignment: Alignment.bottomLeft,child: Text('생년월일',style: TextStyle(fontWeight: FontWeight.bold,color: MAIN_COLOR),))),
                        Expanded(child: SizedBox(
                          width: 150,
                          child: TextFormField(
                            controller: insertViewModel.birthCon,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: const TextStyle(fontSize: 15, height: 1),
                            keyboardType: TextInputType.number,
                            validator: insertViewModel.validate,
                            decoration: const InputDecoration(
                                hintText: '예) 2000.01.01',
                                border: OutlineInputBorder(),
                                errorStyle: TextStyle(fontSize: 0),
                            ),
                          ),
                        )),
                      ],
                    ),
                  )),
                  Container(margin: const EdgeInsets.symmetric(horizontal: 20),child: const Divider()),
                  // 중간층
                  Expanded(child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(flex: 2,child: Align(alignment: Alignment.bottomLeft,child: Text('성별',style: TextStyle(fontWeight: FontWeight.bold,color: MAIN_COLOR),))),
                        Expanded(flex: 2,child: Row(
                          children: [
                            const Text('남',style: TextStyle(fontWeight: FontWeight.bold),),
                            Radio<Gender>(
                              value: Gender.male,
                              groupValue: insertViewModel.gender,
                              onChanged: (Gender? value) {
                                insertViewModel.setGender(value);
                              },
                            ),
                            const Text('여',style: TextStyle(fontWeight: FontWeight.bold),),
                            Radio<Gender>(
                              value: Gender.female,
                              groupValue: insertViewModel.gender,
                              onChanged: (Gender? value) {
                                insertViewModel.setGender(value);
                              },
                            ),
                          ],
                        )),
                        const Expanded(child: SizedBox()), // 비율 유지용
                        const Expanded(flex: 2,child: Align(alignment: Alignment.bottomLeft,child: Text('증상',style: TextStyle(fontWeight: FontWeight.bold,color: MAIN_COLOR),))),
                        const SizedBox(height: 5,),
                        Expanded(flex:3,child: SizedBox(
                          width: 250,
                          child: TextFormField(
                            controller: insertViewModel.symptomCon,
                            textAlignVertical: TextAlignVertical.center,
                            maxLength: 15,
                            style: const TextStyle(fontSize: 15, height: 1),
                            validator: insertViewModel.validate,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                errorStyle: TextStyle(fontSize: 0),
                            ),
                          ),
                        )),
                      ],
                    ),
                  )),
                  Container(margin: const EdgeInsets.symmetric(horizontal: 20),child: const Divider()),
                  // 하단
                  Expanded(child: Container(
                    margin: const EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(child: Align(alignment: Alignment.bottomLeft,child: Text('혈액형',style: TextStyle(fontWeight: FontWeight.bold,color: MAIN_COLOR),))),
                        Expanded(child: SizedBox(
                          width: 80,
                          child: TextFormField(
                            controller: insertViewModel.bloodCon,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: const TextStyle(fontSize: 15, height: 1),
                            validator: insertViewModel.validate,
                            decoration: const InputDecoration(
                                hintText: '혈액형',
                                border: OutlineInputBorder(),
                                errorStyle: TextStyle(fontSize: 0),
                            ),
                          ),
                        )),
                        const Expanded(child: Align(alignment: Alignment.bottomLeft,child: Text('연락처',style: TextStyle(fontWeight: FontWeight.bold,color: MAIN_COLOR),))),
                        Expanded(child: SizedBox(
                          width: 180,
                          child: TextFormField(
                            controller: insertViewModel.phoneCon,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: const TextStyle(fontSize: 15, height: 1),
                            keyboardType: TextInputType.phone,
                            validator: insertViewModel.validate,
                            decoration: const InputDecoration(
                                hintText: '010-0000-0000',
                                border: OutlineInputBorder(),
                                errorStyle: TextStyle(fontSize: 0),
                            ),
                          ),
                        )),
                        const Expanded(child: Align(alignment: Alignment.bottomLeft,child: Text('보호자 연락처',style: TextStyle(fontWeight: FontWeight.bold,color: MAIN_COLOR),))),
                        Expanded(child: SizedBox(
                          width: 180,
                          child: TextFormField(
                            controller: insertViewModel.parentCon,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: const TextStyle(fontSize: 15, height: 1),
                            keyboardType: TextInputType.phone,
                            validator: insertViewModel.validate,
                            decoration: const InputDecoration(
                                hintText: '010-0000-0000',
                                border: OutlineInputBorder(),
                                errorStyle: TextStyle(fontSize: 0),
                            ),
                          ),
                        )),
                      ],
                    ),
                  )),
                  GestureDetector(
                    onTap: () async{
                      try{
                        await insertViewModel.insertData();
                        Fluttertoast.showToast(msg: '등록 성공하였습니다.');
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      } on DioException catch(e){
                        Fluttertoast.showToast(msg: '전송에 실패하였습니다.');
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: MAIN_COLOR,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: const Center(child: Text('확인',style: TextStyle(color: Colors.white,fontSize: 18),)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
