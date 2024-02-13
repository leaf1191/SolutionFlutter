import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/firebase/auth/firebase_auth.dart';
import 'package:emergency_mate/viewmodels/patient/patient_viewmodel.dart';
import 'package:emergency_mate/widgets/app_bar.dart';
import 'package:emergency_mate/widgets/basic_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final patientViewModel = context.read<PatientViewModel>();

    patientViewModel.setBuildContext(context);

    if(!(context.watch<PatientViewModel>().initComplete)){
      patientViewModel.initModel();
    }

    return WillPopScope(
      onWillPop: patientViewModel.exitTapTwice,
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
                                                  fontSize: 15,
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
                                                    onTap: () async{
                                                      try{
                                                        await patientViewModel.signOutAndDeleteDB();
                                                        await patientViewModel.clearData();
                                                        // ignore: use_build_context_synchronously
                                                        Navigator.pushNamedAndRemoveUntil(context, '/intro/title', ModalRoute.withName('/'));
                                                      }catch(e){
                                                        Fluttertoast.showToast(msg: '로그아웃 실패');
                                                      }
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
                            width: 150,
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
                            width: 120,
                            height: 120,
                            color: MAIN_COLOR,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                      padding: const EdgeInsets.all(12),
                                      child: Image.asset('assets/menu/heart.png')
                                  ),
                                ),
                                const Expanded(
                                    flex: 2,
                                    child: Text('건강 데이터',style: TextStyle(fontWeight: FontWeight.bold,color: MAIN_COLOR),)
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/patient/wait');
                          },
                          child: BasicButton(
                            width: 120,
                            height: 120,
                            color: MAIN_COLOR,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                      padding: const EdgeInsets.all(12),
                                      child: Image.asset('assets/menu/ready.png')
                                  ),
                                ),
                                const Expanded(
                                    flex: 2,
                                    child: Text('대기 확인',style: TextStyle(fontWeight: FontWeight.bold,color: MAIN_COLOR),)
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
                Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/patient/guide/hospital');
                          },
                          child: BasicButton(
                            width: 120,
                            height: 120,
                            color: MAIN_COLOR,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                      padding: const EdgeInsets.all(12),
                                      child: Image.asset('assets/menu/introduce.png')
                                  ),
                                ),
                                const Expanded(
                                    flex: 2,
                                    child: Text('병원 안내',style: TextStyle(fontWeight: FontWeight.bold,color: MAIN_COLOR),)
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/patient/guide/procedure');
                          },
                          child: BasicButton(
                            width: 120,
                            height: 120,
                            color: MAIN_COLOR,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                        padding: const EdgeInsets.all(12),
                                        child: Image.asset('assets/menu/info.png')
                                    ),
                                ),
                                const Expanded(
                                    flex: 2,
                                    child: Text('진료 안내',style: TextStyle(fontWeight: FontWeight.bold,color: MAIN_COLOR),)
                                ),
                              ],
                            ),
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
                        child: BasicButton(
                          width: 300,
                          height: 120,
                          color: WARNING_COLOR,
                          circular: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                    padding: const EdgeInsets.all(12),
                                    child: Image.asset('assets/menu/siren.png')
                                ),
                              ),
                              const Expanded(
                                  flex: 2,
                                  child: Text('의료진 긴급 호출',style: TextStyle(fontWeight: FontWeight.bold,color: WARNING_COLOR),)
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 20,)
              ],
            ),
          )
        ),
      ),
    );
  }
}
