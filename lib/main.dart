import 'package:emergency_mate/viewmodels/patient/patient_viewmodel.dart';
import 'package:emergency_mate/views/intro/title_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:emergency_mate/route/page_route.dart';
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


  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => PatientViewModel(),
    child: MaterialApp(
        routes: routes,
        initialRoute: '/intro/title',
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TitlePage();
  }
}
