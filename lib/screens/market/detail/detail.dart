import 'package:flutter/material.dart';
import 'package:flutter_file_store/screens/market/detail/body.dart';

class Detailscreen extends StatelessWidget {
  const Detailscreen({
    Key key,
    this.image,
    this.title,
    this.country,
    this.price,
  }) : super(key: key);

  final String image, title, country;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(image: image, title: title, country: country, price: price),
    );
  }
}
