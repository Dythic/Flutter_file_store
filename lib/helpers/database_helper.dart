import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_file_store/constants/user_constant.dart';

class DatabaseHelper {
  static final _databaseName = "MyMarketPlaceDatabase.db";
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);

    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${UserConstant.tableUsers} (
        ${UserConstant.columnId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${UserConstant.columnEmail} TEXT NOT NULL,
        ${UserConstant.columnPassword} TEXT NOT NULL,
        ${UserConstant.columnUsername} TEXT NOT NULL,
        ${UserConstant.columnImageProfile} TEXT
      )
      ''');
  }

  Future<int> insert(String table, Map<String, Object> data) async {
    Database db = await database;
    int id = await db.insert(table, data);
    return id;
  }

  Future<Map<String, dynamic>> queryBy(String table, List<String> columns, String where, List<String> whereArgs) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(table,
        columns: columns,
        where: where,
        whereArgs: whereArgs
    );
    if (maps.length > 0) {
      return maps.first;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> queryAll(String table, List<String> columns) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(table, columns: columns);
    if (maps.length > 0) {
      return maps;
    }
    return null;
  }

  Future<int> delete(String table, String where, List<String> whereArgs) async {
    Database db = await database;
    return await db.delete(table, where: where, whereArgs: whereArgs);
  }

  Future<int> update(String table, Map<String, Object> data, String where, List<String> whereArgs) async {
    Database db = await database;
    return await db.update(table, data, where: where, whereArgs: whereArgs);
  }
}