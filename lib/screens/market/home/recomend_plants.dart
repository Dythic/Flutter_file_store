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
            image: products[8].image,
            title: products[8].title,
            country: products[8].country,
            price: products[8].price,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detailscreen(
                    image: products[8].image,
                    title: products[8].title,
                    country: products[8].country,
                    price: products[8].price,
                  ),
                ),
              );
            },
          ),
          RecomendPlantCard(
            image: products[9].image,
            title: products[9].title,
            country: products[9].country,
            price: products[9].price,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detailscreen(
                    image: products[9].image,
                    title: products[9].title,
                    country: products[9].country,
                    price: products[9].price,
                  ),
                ),
              );
            },
          ),
          RecomendPlantCard(
            image: products[10].image,
            title: products[10].title,
            country: products[10].country,
            price: products[10].price,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detailscreen(
                    image: products[10].image,
                    title: products[10].title,
                    country: products[10].country,
                    price: products[10].price,
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
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.white.withOpacity(0.23),
                  ),
                ],
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
