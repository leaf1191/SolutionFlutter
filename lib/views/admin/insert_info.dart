import 'package:emergency_mate/viewmodels/admin/insert_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InsertInfo extends StatelessWidget {
  const InsertInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(context.watch<InsertViewModel>().test == null){
      return const Scaffold(
        body: SafeArea(
            child: Center(child: CircularProgressIndicator())
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
            margin: const EdgeInsets.all(10),
            height: 300,
            child: Column(
              children: [
                //이름
                Expanded(child: TextFormField(
                  controller: context.read<InsertViewModel>().nameCon,
                  decoration: const InputDecoration(
                    hintText: '이름'
                  ),
                )),
                //생년 월일
                Expanded(child: TextFormField(
                  controller: context.read<InsertViewModel>().birthCon,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: '생년 월일(예시 : 20240101)'
                  ),
                )),
                //증상
                Expanded(child: TextFormField(
                  controller: context.read<InsertViewModel>().symptomCon,
                  decoration: const InputDecoration(
                      hintText: '증상'
                  ),
                )),
                //연락처
                Expanded(child: TextFormField(
                  controller: context.read<InsertViewModel>().phoneCon,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      hintText: '연락처'
                  ),
                )),
                //보호자 연락처
                Expanded(child: TextFormField(
                  controller: context.read<InsertViewModel>().parentCon,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      hintText: '보호자 연락처'
                  ),
                )),
              ],
            ),
          ),
            ElevatedButton(
                onPressed: () async{
                  await context.read<InsertViewModel>().insertData(); // 돌아가는 모션
                  Fluttertoast.showToast(msg: '성공');
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                child: const Text('확인'),
            )
          ],
        ),
      ),
    );
  }
}
