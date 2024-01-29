import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/widgets/app_bar.dart';
import 'package:emergency_mate/widgets/basic_button.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
                height: 60,
                child: BasicAppBar(title: 'MENU',)
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Column(
                children: [
                  Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: (){
                        print('탭');
                      },
                      child: Container(
                          width: 100,
                          height: 30,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: MAIN_COLOR, width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                              child: Text(
                            '로그아웃',
                            style: TextStyle(
                                color: MAIN_COLOR, fontWeight: FontWeight.bold),
                          ))),
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        child: Image.asset('assets/logo.png'),
                      ),
                    )
                ),],
              ),
            ),
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/patient/heart');
                      },
                      child: BasicButton(
                        width: 150,
                        height: 150,
                        color: MAIN_COLOR,
                      ),
                    ),
                    BasicButton(
                      width: 150,
                      height: 150,
                      color: MAIN_COLOR,
                    ),
                  ],
                ),
            ),
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BasicButton(
                      width: 150,
                      height: 150,
                      color: MAIN_COLOR,
                    ),
                    BasicButton(
                      width: 150,
                      height: 150,
                      color: MAIN_COLOR,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 3,
                              child: Icon(Icons.info_outline,size: 70,color: MAIN_COLOR,)
                          ),
                          Expanded(
                              child: Text('진료 안내',style: TextStyle(fontWeight: FontWeight.bold,color: MAIN_COLOR),)
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ),
            Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/patient/call');
                    },
                    child: const BasicButton(
                      width: 350,
                      height: 150,
                      color: WARNING_COLOR,
                      circular: 40,
                    ),
                  ),
                )
            ),
            const SizedBox(height: 50,)
          ],
        )
      ),
    );
  }
}
