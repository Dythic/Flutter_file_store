import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_file_store/helpers/database_helper.dart';
import 'package:flutter_file_store/helpers/shared_preference_helper.dart';
import 'package:flutter_file_store/models/user_model.dart';
import 'package:flutter_file_store/constants/user_constant.dart';

import 'package:flutter_bcrypt/flutter_bcrypt.dart';


class UserProvider extends ChangeNotifier {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  SharedPreferenceHelper _sharedPreferenceHelper;

  UserProvider() {
    _sharedPreferenceHelper = SharedPreferenceHelper();
  }

  Future<String> get email => _sharedPreferenceHelper.getString(UserConstant.columnEmail);
  Future<String> get imageProfile => _sharedPreferenceHelper.getString(UserConstant.columnImageProfile);
  Future<String> get username => _sharedPreferenceHelper.getString(UserConstant.columnUsername);

  Future<bool> setUsername(String username) async {
    bool res = await _updateUser({UserConstant.columnUsername: username});
    if (res == false) return res;
    res = await _sharedPreferenceHelper.setString(UserConstant.columnUsername, username);

    notifyListeners();
    return res;
  }

  Future<bool> setImageProfile(String path) async {
    bool res = await _updateUser({UserConstant.columnImageProfile: path});
    if (res == false) return res;
    res = await _sharedPreferenceHelper.setString(UserConstant.columnImageProfile, path);

    notifyListeners();
    return res;
  }

  bool fileIsOk(String path) {
    if (path == null)
      return false;
    return File(path).existsSync();
  }

  Future<String> _hashPassword(String password) async {
    String salt = await FlutterBcrypt.salt();
    print("salt: $salt");
    String hash = await FlutterBcrypt.hashPw(password: password, salt: salt);
    print("hash: $hash");

    return hash;
  }

  Future<bool> _verifyPassword(String password, String hashPassword) async {
    print("hash verif: $hashPassword");
    return await FlutterBcrypt.verify(password: password, hash: hashPassword);
  }

  Future<bool> _createUser(String email, String password, String username) {
    UserModel user = UserModel(
      email: email,
      password: password,
      username: username,
      imageProfile: null,
    );
    return dbHelper.insert(UserConstant.tableUsers, user.toMap()).then((id) => id != -1 ? true : false);
  }

  Future<UserModel> _getUser(String email) {
    return dbHelper.queryBy(UserConstant.tableUsers, [
        UserConstant.columnEmail,
        UserConstant.columnPassword,
        UserConstant.columnUsername,
        UserConstant.columnImageProfile
      ], "${UserConstant.columnEmail} = ?", [email])
    .then((data) => data != null ? UserModel.fromMap(data) : null);
  }

  Future<bool> _updateUser(Map<String, dynamic> data) async {
    final email = await this.email;

    return dbHelper.update(UserConstant.tableUsers, data, "${UserConstant.columnEmail} = ?", [email]).then((id) {
      print("Update ID: $id");
      return id != -1 ? true : false;
    });
  }

  Future<bool> login(String email, String password) async {
    UserModel user = await _getUser(email);

    if (user == null || user.email == null || user.password == null)
      return false;
    if (user.email == email && true == await _verifyPassword(password, user.password)) {
      _sharedPreferenceHelper.setString(UserConstant.columnEmail, user.email);
      _sharedPreferenceHelper.setString(UserConstant.columnUsername, user.username);
      _sharedPreferenceHelper.setString(UserConstant.columnImageProfile, user.imageProfile);

      notifyListeners();
      return true;
    } else
      return false;
  }

  Future<bool> register(String email, String password, String username) async {
    final hashPassword = await _hashPassword(password);
    bool value = await _createUser(email, hashPassword, username);

    notifyListeners();
    return value;
  }

  Future<bool> logout() async {
    bool value = await _sharedPreferenceHelper.clear();

    notifyListeners();
    return value;
  }
}