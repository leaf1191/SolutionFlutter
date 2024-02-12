import 'package:emergency_mate/viewmodels/admin/admin_viewmodel.dart';
import 'package:emergency_mate/viewmodels/admin/insert_viewmodel.dart';
import 'package:emergency_mate/viewmodels/admin/register_viewmodel.dart';
import 'package:emergency_mate/viewmodels/intro/intro_viewmodel.dart';
import 'package:emergency_mate/viewmodels/patient/guide/hospital_viewmodel.dart';
import 'package:emergency_mate/viewmodels/patient/wait_viewmodel.dart';
import 'package:emergency_mate/views/admin/insert_info.dart';
import 'package:emergency_mate/views/admin/register_page.dart';
import 'package:emergency_mate/views/admin/main_page.dart' as admin;
import 'package:emergency_mate/views/intro/select_page.dart';
import 'package:emergency_mate/views/intro/title_page.dart';
import 'package:emergency_mate/views/patient/call_page.dart';
import 'package:emergency_mate/views/patient/guide/hospital.dart';
import 'package:emergency_mate/views/patient/guide/procedure.dart';
import 'package:emergency_mate/views/patient/heart/heart_page.dart';
import 'package:emergency_mate/views/patient/heart/search_device.dart';
import 'package:emergency_mate/views/patient/my_turn_page.dart';
import 'package:emergency_mate/views/patient/wait_page.dart';
import 'package:emergency_mate/views/patient/main_page.dart' as patient;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final Map<String, WidgetBuilder> routes = {
  '/intro/title' : (BuildContext context) => ChangeNotifierProvider(create: (BuildContext context) => IntroViewModel(),
      child: const TitlePage()),
  '/intro/select' : (BuildContext context) => ChangeNotifierProvider(create: (BuildContext context) => IntroViewModel(),
  child: const SelectPage()),
  '/patient/main' : (BuildContext context) => const patient.MainPage(),
  '/patient/heart' : (BuildContext context) => const HeartPage(),
  '/patient/device' : (BuildContext context) => const SearchDevice(),
  '/patient/call' : (BuildContext context) => const CallPage(),
  '/patient/wait' : (BuildContext context) => ChangeNotifierProvider(create: (BuildContext context) => WaitViewModel(),
  child: const WaitPage()),
  '/patient/guide/hospital' : (BuildContext context) => ChangeNotifierProvider(create: (BuildContext context) => HospitalViewModel(),
  child: const GuideHospital()),
  '/patient/guide/procedure' : (BuildContext context) => const GuideProcedure(),
  '/patient/myTurn' : (BuildContext context) => const MyTurn(),
  '/admin/main' : (BuildContext context) => ChangeNotifierProvider(create: (BuildContext context) => AdminViewModel(),
      child: const admin.MainPage()),
  '/admin/register' : (BuildContext context) => ChangeNotifierProvider(create: (BuildContext context) => RegisterViewModel(),
      child: const RegisterPage()),
};

/*
안쓰는 루트
'/admin/insert' : (BuildContext context) => ChangeNotifierProvider(create: (BuildContext context) => InsertViewModel(),
      child: const InsertInfo())
 */