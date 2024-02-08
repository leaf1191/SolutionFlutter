import 'package:dio/dio.dart';

const baseUrl = 'http://15.164.81.96:8080';
const addUser = '/list/add_user';
const deleteUser = '/list/delete';
const toPatient = '/list/add_no_wait_patient';
const realPatient = '/list/add_wait_patient';
const toAdmin = '/list/add_admin';
const getUser = '/list/mine';

const getNoWait = '/list/get_no_wait_patients';
const postInfo = '/list/add_info';

final dio = Dio(BaseOptions(
  baseUrl: baseUrl
));