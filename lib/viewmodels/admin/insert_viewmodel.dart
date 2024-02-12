import 'package:dio/dio.dart';
import 'package:emergency_mate/models/network_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum Gender { male, female}

class InsertViewModel extends ChangeNotifier {

  final _newWork = NetWorkModel();

  InsertViewModel(this._gmail) {
    // 미등록 인원 한명의 정보를 받아와야 함
    getUserInfo();
  }

  Map? _userInfo;
  late final String? _gmail;
  Gender? _gender;

  Map? get userInfo => _userInfo;
  Gender? get gender => _gender;

  // 컨트롤러
  final nameCon = TextEditingController();
  final birthCon = TextEditingController();
  final symptomCon = TextEditingController();
  final bloodCon = TextEditingController();
  final phoneCon = TextEditingController();
  final parentCon = TextEditingController();

  // 글로벌 키
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  getUserInfo() async {
    try{
      var response = await _newWork.getNoWaitUserInfo(_gmail);
      _userInfo = response.data;
      notifyListeners();
    } on DioException catch(e){
      Fluttertoast.showToast(msg: '유저 정보를 가져오는데 실패했습니다.');
    }
  }

  insertData() async{
    if(!_checkValidation()){
      Fluttertoast.showToast(msg: '필드를 입력해 주세요.');
      return Future.error('유효하지 않음');
    }
    String sex;
    if(_gender == Gender.male){
      sex = '남';
    } else if(_gender == Gender.female){
      sex = '여';
    } else {
      sex = '미등록';
    }

    Map<String, String> newData = {
      'uid' : _userInfo!['uid'],
      'email' : _userInfo!['email'],
      'name' : nameCon.text,
      'date' : birthCon.text,
      'gender' : sex,
      'symptom' : symptomCon.text,
      'bloodType' : bloodCon.text,
      'phoneNum' : phoneCon.text,
      'phoneNum2' : parentCon.text,
    };

    await _newWork.postUserInfo(newData, _userInfo!['email']);
  }

  setGender(Gender? value){
    _gender = value;
    notifyListeners();
  }

  String? validate(String? value){
    if(value == '') return '입력해 주세요';
    return null;
  }

  bool _checkValidation() => key.currentState?.validate() ?? false;

}