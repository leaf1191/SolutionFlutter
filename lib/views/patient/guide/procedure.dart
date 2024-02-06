import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class GuideProcedure extends StatelessWidget {
  const GuideProcedure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
                height: 60,
                child: BackAppBar(title: '진료 안내',back: 'Home',color: MAIN_COLOR,)
            ),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      height: 20,
                      child: const Row(
                        children: [
                          CircleAvatar(backgroundColor: MAIN_COLOR,radius: 5,),
                          SizedBox(width: 5,),
                          Text('응급실 진료절차',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                        ],
                      ),
                    ),
                    Expanded(child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Image.asset('assets/guide/procedure.jpg'),
                    )),
                  ],
                ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    height: 20,
                    child: const Row(
                      children: [
                        CircleAvatar(backgroundColor: MAIN_COLOR,radius: 5,),
                        SizedBox(width: 5,),
                        Text('응급 증상',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                      ],
                    ),
                  ),
                  Expanded(child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Image.asset('assets/guide/symptoms.jpg'),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}