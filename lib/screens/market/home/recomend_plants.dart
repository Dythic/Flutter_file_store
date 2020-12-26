import 'package:flutter/material.dart';
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
            image: "assets/images/wireless headset.png",
            title: "Headset",
            country: "France",
            price: 150,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detailscreen(
                    image: "assets/images/wireless headset.png",
                    title: "Headset",
                    country: "France",
                    price: 150,
                  ),
                ),
              );
            },
          ),
          RecomendPlantCard(
            image: "assets/images/shoes2.png",
            title: "Shoes",
            country: "China",
            price: 90,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detailscreen(
                    image: "assets/images/shoes2.png",
                    title: "Shoes",
                    country: "China",
                    price: 90,
                  ),
                ),
              );
            },
          ),
          RecomendPlantCard(
            image: "assets/images/Image Popular Product 3.png",
            title: "Helmet",
            country: "Russia",
            price: 25,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detailscreen(
                    image: "assets/images/Image Popular Product 3.png",
                    title: "Helmet",
                    country: "Russia",
                    price: 25,
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
