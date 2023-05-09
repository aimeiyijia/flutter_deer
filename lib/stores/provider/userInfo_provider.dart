import 'package:flutter/material.dart';
import 'package:manager_app/models/user_model.dart';
class UserInfoProvider extends ChangeNotifier{
  late UserModel _info;
  UserModel get userInfo => _info;
  void setUserInfo(Map<String, dynamic> info){
    _info = UserModel.fromJson(info);
    notifyListeners();
  }
}