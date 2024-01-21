import 'package:emergency_mate/viewmodels/admin/insert_viewmodel.dart';
import 'package:emergency_mate/viewmodels/admin/register_viewmodel.dart';
import 'package:emergency_mate/views/admin/insert_info.dart';
import 'package:emergency_mate/views/admin/main_page.dart' as admin;
import 'package:emergency_mate/views/admin/register_page.dart';
import 'package:emergency_mate/views/intro/select_page.dart';
import 'package:emergency_mate/views/intro/title_page.dart';
import 'package:emergency_mate/views/patient/main_page.dart' as patient;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  /* splash screen 멈추기
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  */

  runApp(MaterialApp(
      routes: <String, WidgetBuilder>{
        '/intro/title' : (BuildContext context) => const TitlePage(),
        '/intro/select' : (BuildContext context) => const SelectPage(),
        '/patient/main' : (BuildContext context) => const patient.MainPage(),
        '/admin/main' : (BuildContext context) => const admin.MainPage(),
        '/admin/register' : (BuildContext context) => ChangeNotifierProvider(create: (BuildContext context) => RegisterViewModel(),
        child: const RegisterPage()),
        '/admin/insert' : (BuildContext context) => ChangeNotifierProvider(create: (BuildContext context) => InsertViewModel(),
        child: const InsertInfo()),
      },
      initialRoute: '/admin/main',
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
