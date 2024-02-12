import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/viewmodels/patient/wait_viewmodel.dart';
import 'package:emergency_mate/widgets/app_bar.dart';
import 'package:emergency_mate/widgets/basic_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WaitPage extends StatelessWidget {
  const WaitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final waitViewModel = context.read<WaitViewModel>();
    final waitWatch = context.watch<WaitViewModel>();

    if(waitWatch.waitNum == null){
      return const Scaffold(
        body: SafeArea(
            child: Center(child: CircularProgressIndicator())
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background_img.jpg'),
                  fit: BoxFit.fill
              )
          ),
          child: Column(
            children: waitWatch.isWait? [
              const SizedBox(
                height: 60,
                child: BackAppBar(
                  back: 'Home',
                  title: '대기 확인',
                  color: MAIN_COLOR,
                ),
              ),
              Expanded(flex: 4,child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text('실시간 대기',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: const EdgeInsets.all(30),
                      child: BasicButton(
                        width: double.infinity,
                        height: double.infinity,
                        color: MAIN_COLOR,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                    margin: const EdgeInsets.all(20),
                                    child: Image.asset('assets/wait/user_img.png')
                                ),
                            ),
                            Expanded(
                                child: Text('${waitViewModel.waitNum}번',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text('내 정보',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          margin: const EdgeInsets.all(30),
                          child: BasicButton(
                            width: double.infinity,
                            height: double.infinity,
                            color: MAIN_COLOR,
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(flex: 5,child: Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Row(
                                          children: [
                                            const Text('이름',style: TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold,fontSize: 20),),
                                            const SizedBox(width: 5,),
                                            Text('${waitViewModel.myInfo?['name']}',style: const TextStyle(fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                      ),),
                                  Expanded(flex: 5,child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: [
                                        const Text('생년월일',style: TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold,fontSize: 20),),
                                        const SizedBox(width: 5,),
                                        Text('${waitViewModel.myInfo?['date']}',style: const TextStyle(fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  )),
                                  Expanded(flex: 5,child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: [
                                        const Text('증상',style: TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold,fontSize: 20),),
                                        const SizedBox(width: 5,),
                                        Text('${waitViewModel.myInfo?['symptom']}',style: const TextStyle(fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  )),
                                  Expanded(flex: 3,child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 20),
                                    child: const Text('연락처',style: TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold,fontSize: 20),),
                                  )),
                                  Expanded(flex: 3,child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Text('${waitViewModel.myInfo?['phoneNum']}',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  )),
                                  Expanded(flex: 3,child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 20),
                                    child: const Text('보호자 연락처',style: TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold,fontSize: 20),),
                                  )),
                                  Expanded(flex: 3,child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Text('${waitViewModel.myInfo?['phoneNum2']}',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ] : [
              const SizedBox(
                height: 60,
                child: BackAppBar(
                  back: 'Home',
                  title: '대기 확인',
                  color: MAIN_COLOR,
                ),
              ),
              Expanded(flex: 4,child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text('실시간 대기',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: const EdgeInsets.all(30),
                      child: const BasicButton(
                        width: double.infinity,
                        height: double.infinity,
                        color: MAIN_COLOR,
                        child: Center(child: Text('대기 정보 없음',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)),
                      ),
                    ),
                  ),
                ],
              )),
              Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text('내 정보',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          margin: const EdgeInsets.all(30),
                          child: BasicButton(
                            width: double.infinity,
                            height: double.infinity,
                            color: MAIN_COLOR,
                            child: Column(
                              children: [
                                Expanded(
                                    child: Container(
                                        margin: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                                        child: Image.asset('assets/wait/add.png')
                                    ),
                                ),
                                const SizedBox(height: 10,),
                                const Expanded(
                                    child: Text('         접수처에서\n추가 정보를 입력하세요.',
                                      style: TextStyle(fontWeight: FontWeight.bold,color: MAIN_COLOR,fontSize: 20),
                                    ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}