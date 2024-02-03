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

    if(context.watch<InsertViewModel>().test == null){
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
            height: 800,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                  child: BasicAppBar(title: '상세 정보',),
                ),
                Expanded(child: Container(
                  margin: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(child: Align(alignment: Alignment.bottomLeft,child: Text('이메일',style: TextStyle(fontWeight: FontWeight.bold,color: MAIN_COLOR),))),
                      const Expanded(child: Align(alignment: Alignment.centerLeft,child: Text('구글의@자체.이메일',style: TextStyle(fontWeight: FontWeight.bold),))),
                      const Expanded(child: Align(alignment: Alignment.bottomLeft,child: Text('이름',style: TextStyle(fontWeight: FontWeight.bold,color: MAIN_COLOR),))),
                      Expanded(child: TextFormField(
                        textAlignVertical: TextAlignVertical.bottom,
                        style: const TextStyle(fontSize: 15, height: 1),
                        decoration: const InputDecoration(
                            hintText: '이름',
                            border: OutlineInputBorder()
                        ),
                      )),
                      const Expanded(child: Align(alignment: Alignment.bottomLeft,child: Text('생년월일',style: TextStyle(fontWeight: FontWeight.bold,color: MAIN_COLOR),))),
                      Expanded(child: TextFormField(
                        textAlignVertical: TextAlignVertical.bottom,
                        style: const TextStyle(fontSize: 15, height: 1),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: '예) 2000.01.01',
                            border: OutlineInputBorder()
                        ),
                      )),
                    ],
                  ),
                )),
                Container(margin: const EdgeInsets.symmetric(horizontal: 20),child: const Divider()),
                Expanded(child: Container()),
                Container(margin: const EdgeInsets.symmetric(horizontal: 20),child: const Divider()),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
