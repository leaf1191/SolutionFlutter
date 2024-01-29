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
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background_img.png'),
              fit: BoxFit.fill
            )
          ),
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
                          showDialog(
                              context: context,
                              builder: (context){
                                return Center(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 30),
                                    width: double.infinity,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Column(
                                      children: [
                                        const Expanded(
                                            child: Center(
                                          child: Text(
                                            '대기 중인 경우, 대기가 취소됩니다.\n     로그아웃 하시겠습니까?',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                decoration: TextDecoration.none),
                                          ),
                                        )),
                                        Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    width: 120,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: MAIN_COLOR),
                                                      borderRadius: BorderRadius.circular(20)
                                                    ),
                                                    child: const Center(
                                                      child: Text('Cancel',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: MAIN_COLOR,
                                                            decoration: TextDecoration.none),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    print('탭');
                                                  },
                                                  child: Container(
                                                    width: 120,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      color: MAIN_COLOR,
                                                      borderRadius: BorderRadius.circular(20)
                                                    ),
                                                    child: const Center(
                                                      child: Text('OK',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.white,
                                                            decoration: TextDecoration.none),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          );
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
          ),
        )
      ),
    );
  }
}
