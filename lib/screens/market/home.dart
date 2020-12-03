import 'package:flutter/material.dart';

import 'home/header_with_seachbox.dart';
import 'home/featurred_plants.dart';
import 'home/title_with_more_bbtn.dart';
import 'home/recomend_plants.dart';
import 'home/banner.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          BannerCard(),
          TitleWithMoreBtn(title: "Featured Product", press: () {}),
          FeaturePlants(),
          TitleWithMoreBtn(title: "Recomended", press: () {}),
          RecomendsPlants(),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
