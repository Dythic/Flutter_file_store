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
  UserModel _user;

  UserProvider() {
    _sharedPreferenceHelper = SharedPreferenceHelper();
  }

  Future<int> get id => _sharedPreferenceHelper.getInt(UserConstant.columnId);
  Future<String> get username => _sharedPreferenceHelper.getString(UserConstant.columnUsername);
  UserModel get user => _user;

  Future<bool> setUser(String email, String username) async {
    if (email != null || username != null) {
      bool res;

      if (email != null && username != null)
        res = await _updateCurrentUser({UserConstant.columnEmail: email, UserConstant.columnUsername: username});
      else if (email == null)
        res = await _updateCurrentUser({UserConstant.columnUsername: username});
      else
        res = await _updateCurrentUser({UserConstant.columnEmail: email});

      if (res == false) return res;
      _user.email = email;
      _user.username = username;

      notifyListeners();
      return res;
    } else
      return true;
  }

  Future<bool> setImageProfile(String path) async {
    final res = await _updateCurrentUser({UserConstant.columnImageProfile: path});
    if (res == false) return res;
    _user.imageProfile = path;

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

  Future<UserModel> _getUserByEmail(String email) {
    return dbHelper.queryBy(UserConstant.tableUsers, [
        UserConstant.columnId,
        UserConstant.columnEmail,
        UserConstant.columnPassword,
        UserConstant.columnUsername,
        UserConstant.columnImageProfile
      ], "${UserConstant.columnEmail} = ?", [email])
    .then((data) => data != null ? UserModel.fromMap(data) : null);
  }

  Future<UserModel> _getUserById(int id) {
    return dbHelper.queryBy(UserConstant.tableUsers, [
        UserConstant.columnId,
        UserConstant.columnEmail,
        UserConstant.columnPassword,
        UserConstant.columnUsername,
        UserConstant.columnImageProfile
      ], "${UserConstant.columnId} = ?", [id.toString()])
    .then((data) => data != null ? UserModel.fromMap(data) : null);
  }

  Future<bool> _updateCurrentUser(Map<String, dynamic> data) async {
    return dbHelper.update(UserConstant.tableUsers, data, "${UserConstant.columnId} = ?", [_user.id.toString()]).then((id) {
      print("Update ID: $id");
      return id != -1 ? true : false;
    });
  }

  Future<bool> login(String email, String password) async {
    UserModel user = await _getUserByEmail(email);

    if (user == null || user.email == null || user.password == null)
      return false;
    if (user.email == email && true == await _verifyPassword(password, user.password)) {
      _sharedPreferenceHelper.setInt(UserConstant.columnId, user.id);

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
    final value = await _sharedPreferenceHelper.clear();
    _user = null;

    notifyListeners();
    return value;
  }

  Future<bool> isLogged() async {
    if (_user != null) return true;
    final id = await this.id;
    if (id == -1) return false;
    _user = await _getUserById(id);
    return true;
  }
}