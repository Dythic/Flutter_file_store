import 'package:flutter/material.dart';

import 'package:flutter_file_store/constants/Product.dart';

import 'package:flutter_file_store/screens/market/detail/body.dart';

class Detailscreen extends StatelessWidget {
  const Detailscreen({
    Key key,
    this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        product: product,
      ),
    );
  }
}
