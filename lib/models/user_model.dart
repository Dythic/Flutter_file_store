import 'package:flutter/material.dart';

import 'package:flutter_file_store/constants/user_constant.dart';

class UserModel {
  int id;
  String email;
  String password;
  String username;
  String imageProfile;

  UserModel({
    @required this.email,
    @required this.password,
    @required this.username,
    @required this.imageProfile
  });
  UserModel.empty();

  UserModel.fromMap(Map<String, dynamic> map) {
    email = map[UserConstant.columnEmail];
    password = map[UserConstant.columnPassword];
    username = map[UserConstant.columnUsername];
    imageProfile = map[UserConstant.columnImageProfile];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      UserConstant.columnEmail: email,
      UserConstant.columnPassword: password,
      UserConstant.columnUsername: username,
      UserConstant.columnImageProfile: imageProfile,
    };
    return map;
  }
}