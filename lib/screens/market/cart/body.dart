import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_file_store/constants/Product.dart';

import 'package:flutter_file_store/providers/user_provider.dart';

import 'package:flutter_file_store/screens/market/cart/cart_item_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: userProvider.user.cart.length,
        itemBuilder: (context, index) {
          final json = jsonDecode(userProvider.user.cart[index]);
          final count = json['count'];
          final product = Product.fromJson(json['product']);
          
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              onDismissed: (direction) {
                if (direction == DismissDirection.endToStart)
                  userProvider.removeFromCart(product.id);
              },
              key: Key(product.id.toString()),
              direction: DismissDirection.endToStart,
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Color(0xFFFFFE6E6),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg"),
                  ],
                ),
              ),
              child: CartItemCard(products: product, count: count),
            ),
          );
        }
      ),
    );
  }
}
