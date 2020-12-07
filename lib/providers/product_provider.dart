import 'package:flutter/material.dart';
import 'package:flutter_file_store/constants/product_constant.dart';
import 'package:flutter_file_store/constants/user_constant.dart';

import 'package:flutter_file_store/helpers/database_helper.dart';
import 'package:flutter_file_store/helpers/shared_preference_helper.dart';
import 'package:flutter_file_store/models/product_model.dart';


class ProductProvider extends ChangeNotifier {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  SharedPreferenceHelper _sharedPreferenceHelper;

  ProductProvider() {
    _sharedPreferenceHelper = SharedPreferenceHelper();
  }

  Future<bool> createProduct(String name, String price, String description, String photo, String tags) async {
    int sellerId = await _sharedPreferenceHelper.getInt(UserConstant.columnId);

    ProductModel product = ProductModel(
      name: name,
      price: price,
      description: description,
      photo: null,
      tags: tags,
      sellerId: sellerId,
    );
    return dbHelper.insert(ProductConstant.tableProducts, product.toMap()).then((id) => id != -1 ? true : false);
  }

  Future<ProductModel> getProduct(int id) {
    return dbHelper.queryBy(ProductConstant.tableProducts, [
        ProductConstant.columnName,
        ProductConstant.columnPrice,
        ProductConstant.columnDescription,
        ProductConstant.columnPhoto,
        ProductConstant.columnTags,
        ProductConstant.columnSeller
      ], "${ProductConstant.columnId} = ?", [id.toString()])
    .then((data) => data != null ? ProductModel.fromMap(data) : null);
  }

  Future<List<ProductModel>> getAllProductsByTags(List<String> tags) {
    return dbHelper.queryAllBy(ProductConstant.tableProducts, [
        ProductConstant.columnName,
        ProductConstant.columnPrice,
        ProductConstant.columnDescription,
        ProductConstant.columnPhoto,
        ProductConstant.columnTags,
        ProductConstant.columnSeller
      ], "${ProductConstant.columnTags} LIKE ?", [tags.toString()])
    .then((data) {
      List<ProductModel> products = [];
      if (data != null) {
        data.forEach((element) {
          products.add(ProductModel.fromMap(element));
        });
      }
      return products;
    });
  }

  Future<List<ProductModel>> getAllProductsByName(String searchName) {
    return dbHelper.queryAllBy(ProductConstant.tableProducts, [
        ProductConstant.columnName,
        ProductConstant.columnPrice,
        ProductConstant.columnDescription,
        ProductConstant.columnPhoto,
        ProductConstant.columnTags,
        ProductConstant.columnSeller
      ], "${ProductConstant.columnName} LIKE ?", [searchName])
    .then((data) {
      List<ProductModel> products = [];
      if (data != null) {
        data.forEach((element) {
          products.add(ProductModel.fromMap(element));
        });
      }
      return products;
    });
  }

  Future<List<ProductModel>> getAllProductsSellByConnectedUser(int userId) {
    return dbHelper.queryAllBy(ProductConstant.tableProducts, [
        ProductConstant.columnName,
        ProductConstant.columnPrice,
        ProductConstant.columnDescription,
        ProductConstant.columnPhoto,
        ProductConstant.columnTags,
        ProductConstant.columnSeller
      ], "${ProductConstant.columnSeller} = ?", [userId.toString()])
    .then((data) {
      List<ProductModel> products = [];
      if (data != null) {
        data.forEach((element) {
          products.add(ProductModel.fromMap(element));
        });
      }
      return products;
    });
  }
}