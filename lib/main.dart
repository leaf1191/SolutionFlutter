import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/firebase/auth/firebase_auth.dart';
import 'package:emergency_mate/http/dio.dart';
import 'package:emergency_mate/viewmodels/patient/patient_viewmodel.dart';
import 'package:emergency_mate/views/intro/title_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:emergency_mate/route/page_route.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<String> getUserRole() async {
  dio.options.headers['Authorization'] = await auth.user?.getIdToken();
  var response = await dio.get(getUser);
  final roleData = response.data['role'];
  if(roleData == 'USER') {
    return '/intro/select';
  } else if(roleData == 'NO_WAIT_PATIENT' || roleData == 'WAIT_PATIENT'){
    return '/patient/main';
  } else if(roleData == 'ADMIN'){
    return '/admin/main';
  } else {
    return '/intro/title';
  }
}


void main() async {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // 파이어 베이스 초기화
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // 스플래시 시작
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  auth; // auth 초기화
  await Future.delayed(const Duration(milliseconds: 500));

  // 자동 로그인
  String initialRoute = '/intro/title';
  if(auth.hasUser){
    try{
      initialRoute = await getUserRole();
    } catch(e){
      Fluttertoast.showToast(msg: '유저 정보를 불러오는데 실패하였습니다.');
    }
  }

  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => PatientViewModel(),
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: MAIN_COLOR)
        ),
        routes: routes,
        initialRoute: initialRoute,
    ),
  ));

  // 스플래시 제거
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TitlePage();
  }
}
