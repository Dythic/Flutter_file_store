import 'package:flutter/material.dart';

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({
    Key key,
    @required this.size,
    this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0 * 3),
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0 * 3),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 20.0 * 3),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(image,
                width: size.width * 0.5,
                height: size.height * 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
