import 'package:flutter/material.dart';
import 'package:flutter_file_store/constants/Product.dart';

import '../detail/detail.dart';

class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          RecomendPlantCard(
            image: products[0].image,
            title: products[0].title,
            country: products[0].country,
            price: products[0].price,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detailscreen(
                    image: products[0].image,
                    title: products[0].title,
                    country: products[0].country,
                    price: products[0].price,
                  ),
                ),
              );
            },
          ),
          RecomendPlantCard(
            image: products[2].image,
            title: products[2].title,
            country: products[2].country,
            price: products[2].price,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detailscreen(
                    image: products[2].image,
                    title: products[2].title,
                    country: products[2].country,
                    price: products[2].price,
                  ),
                ),
              );
            },
          ),
          RecomendPlantCard(
            image: products[3].image,
            title: products[3].title,
            country: products[3].country,
            price: products[3].price,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detailscreen(
                    image: products[3].image,
                    title: products[3].title,
                    country: products[3].country,
                    price: products[3].price,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key key,
    this.image,
    this.title,
    this.country,
    this.price,
    this.press,
  }) : super(key: key);

  final String image, title, country;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: 20.0,
        top: 20.0 / 2,
        bottom: 20.0 * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(20.0 / 2),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$$price',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
