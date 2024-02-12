import 'package:dio/dio.dart';

const baseUrl = 'http://15.164.81.96:8080';
const addUser = '/list/add_user';
const deleteUser = '/list/delete';
const toPatient = '/list/add_no_wait_patient';
const realPatient = '/list/add_wait_patient';
const toAdmin = '/list/add_admin';
// 자기 정보 받아오기
const getUser = '/list/mine';
const getWaitNum = '/list/waitNum';
// 미등록 리스트 받아오기 / 포스트(지메일 필요)
const getNoWait = '/list/get_no_wait_patients';
const postInfo = '/list/add_info';
// 등록유저 리스트 받아오기(지메일 필요)
const getWait = '/list/wait';
// 호출 관리(지메일 필요)
const callPatient = '/call';
const callAdmin = '/call/admin';
const callOffPatient = '/call/off';

final dio = Dio(BaseOptions(
  baseUrl: baseUrl
));