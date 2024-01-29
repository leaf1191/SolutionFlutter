import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/viewmodels/admin/admin_viewmodel.dart';
import 'package:emergency_mate/viewmodels/admin/insert_viewmodel.dart';
import 'package:emergency_mate/viewmodels/admin/register_viewmodel.dart';
import 'package:emergency_mate/viewmodels/intro/intro_viewmodel.dart';
import 'package:emergency_mate/views/admin/insert_info.dart';
import 'package:emergency_mate/views/admin/main_page.dart' as admin;
import 'package:emergency_mate/views/admin/register_page.dart';
import 'package:emergency_mate/views/intro/select_page.dart';
import 'package:emergency_mate/views/intro/title_page.dart';
import 'package:emergency_mate/views/patient/call_page.dart';
import 'package:emergency_mate/views/patient/heart_page.dart';
import 'package:emergency_mate/views/patient/main_page.dart' as patient;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  /* splash screen 멈추기
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  */
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // 파이어 베이스 초기화
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(MaterialApp(
      routes: <String, WidgetBuilder>{
        '/intro/title' : (BuildContext context) => ChangeNotifierProvider(create: (BuildContext context) => IntroViewModel(),
        child: const TitlePage()),
        '/intro/select' : (BuildContext context) => const SelectPage(),
        '/patient/main' : (BuildContext context) => const patient.MainPage(),
        '/patient/heart' : (BuildContext context) => const HeartPage(),
        '/patient/call' : (BuildContext context) => const CallPage(),
        '/admin/main' : (BuildContext context) => ChangeNotifierProvider(create: (BuildContext context) => AdminViewModel(),
        child: const admin.MainPage()),
        '/admin/register' : (BuildContext context) => ChangeNotifierProvider(create: (BuildContext context) => RegisterViewModel(),
        child: const RegisterPage()),
        '/admin/insert' : (BuildContext context) => ChangeNotifierProvider(create: (BuildContext context) => InsertViewModel(),
        child: const InsertInfo()),
      },
      initialRoute: '/patient/main',
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TitlePage();
  }
}
