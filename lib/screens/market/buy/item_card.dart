import 'package:flutter/material.dart';
import 'package:flutter_file_store/constants/Product.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              /*child: Hero(
                tag: "${product.id}",*/
              child: Image.asset(product.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0 / 4),
            child: Text.rich(
              TextSpan(
                text: "${product.title}\n",
                style: TextStyle(color: Colors.grey),
                children: [
                  TextSpan(
                    text: "\$${product.price.toString()}",
                    style: TextStyle(color: Colors.orange),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
