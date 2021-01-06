import 'package:flutter/material.dart';

import 'package:flutter_file_store/screens/market/home/header_with_seachbox.dart';
import 'package:flutter_file_store/screens/market/home/featurred_plants.dart';
import 'package:flutter_file_store/screens/market/home/title_with_more_bbtn.dart';
import 'package:flutter_file_store/screens/market/home/recomend_plants.dart';
import 'package:flutter_file_store/screens/market/home/banner.dart';

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
