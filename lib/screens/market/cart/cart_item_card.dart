import 'package:flutter/material.dart';
import 'package:flutter_file_store/constants/Product.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key key,
    @required this.products,
  }) : super(key: key);

  final Product products;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(products.image),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              products.title,
              style: TextStyle(fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${products.price}",
                style: TextStyle(color: Colors.grey),
                children: [
                  TextSpan(
                    text: " x1",
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
