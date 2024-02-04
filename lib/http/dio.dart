import 'package:dio/dio.dart';

const baseUrl = 'http://15.164.81.96:8080';
const addUser = '/list/add';
const deleteUser = '/list/delete';
const toPatient = '/list/add_no_wait_patient';
const toAdmin = '////';
const getUser = '/list/mine';

final dio = Dio(BaseOptions(
  baseUrl: baseUrl
));