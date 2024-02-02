import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/firebase/auth/firebase_auth.dart';
import 'package:emergency_mate/viewmodels/intro/intro_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double margin = 80;
    const double circular = 120;

    return WillPopScope(
      onWillPop: context.read<IntroViewModel>().exitTapTwice,
      child: Scaffold(
        backgroundColor: Colors.blue.shade100,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(margin, margin, margin, 0),
                  child: Image.asset('assets/logo.png'),
                ),
              )),
              Expanded(child: Container(
                margin: const EdgeInsets.all(30),
                child: const Text('Welcome',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              )),
              Expanded(child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(circular),topLeft: Radius.circular(circular))
                ),
                child: Column(
                  children: [
                    const Expanded(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)
                        ),
                    ),
                    Expanded(flex: 2,child: Align(
                      child: GestureDetector(
                        onTap: () async {
                          try{
                            await auth.signInWithGoogle();
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(context, '/intro/select');
                          } catch(e){
                            Fluttertoast.showToast(msg: '로그인 실패');
                          }
                        },
                        child: Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: MAIN_COLOR),
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: const Center(child: Text('Google Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: MAIN_COLOR),)),
                        ),
                      ),
                    )),
                  ],
                ),
              )),
            ],
          )
        ),
      ),
    );
  }
}
