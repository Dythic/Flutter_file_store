import 'package:flutter/material.dart';

import 'package:flutter_file_store/constants/product_constant.dart';

import 'package:flutter_file_store/models/user_model.dart';

class ProductModel {
  int id;
  String name;
  String price;
  String description;
  String photo;
  String tags;
  int sellerId;
  UserModel seller;

  ProductModel({
    @required this.name,
    @required this.price,
    @required this.description,
    @required this.photo,
    @required this.tags,
    @required this.sellerId
  });
  ProductModel.empty();

  ProductModel.fromMap(Map<String, dynamic> map) {
    name = map[ProductConstant.columnName];
    price = map[ProductConstant.columnPrice];
    description = map[ProductConstant.columnDescription];
    photo = map[ProductConstant.columnPhoto];
    tags = map[ProductConstant.columnTags];
    sellerId = map[ProductConstant.columnSeller];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      ProductConstant.columnName: name,
      ProductConstant.columnPrice: price,
      ProductConstant.columnDescription: description,
      ProductConstant.columnPhoto: photo,
      ProductConstant.columnTags: tags,
      ProductConstant.columnSeller: sellerId,
    };
    return map;
  }
}