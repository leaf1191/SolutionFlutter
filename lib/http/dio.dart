import 'package:dio/dio.dart';

const baseUrl = 'http://15.164.81.96:8080';
const addUser = '/list/add';
const deleteUser = '/list/delete';

final dio = Dio(BaseOptions(
  baseUrl: baseUrl
));