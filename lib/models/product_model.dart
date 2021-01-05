import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_file_store/constants/product_constant.dart';

import 'package:flutter_file_store/models/user_model.dart';

class ProductModel {
  int id;
  String name;
  String price;
  String description;
  String photo;
  List<String> tags;
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
    tags = jsonDecode(map[ProductConstant.columnTags]).cast<String>();
    sellerId = map[ProductConstant.columnSeller];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      ProductConstant.columnName: name,
      ProductConstant.columnPrice: price,
      ProductConstant.columnDescription: description,
      ProductConstant.columnPhoto: photo,
      ProductConstant.columnTags: jsonEncode(tags),
      ProductConstant.columnSeller: sellerId,
    };
    return map;
  }

  @override
  String toString() {
    return 'Product: {name: $name, price: $price, description: $description, photo: $photo, tags: $tags}';
  }
}