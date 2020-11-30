import 'package:flutter/material.dart';

import 'package:flutter_file_store/screens/market/home.dart';
import 'package:flutter_file_store/screens/market/buy.dart';
import 'package:flutter_file_store/screens/market/sell.dart';
import 'package:flutter_file_store/screens/profile/profile.dart';

import 'package:flutter_file_store/constants/routes_constant.dart';

class Market extends StatefulWidget {
  @override
  MarketState createState() => MarketState();
}

class MarketState extends State<Market> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    BuyPage(),
    SellPage(),
    ProfilePage()
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      onTap: onTappedBar,
      currentIndex: _currentIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.search_outlined),
          label: "Browse",
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.local_offer_outlined),
          label: "Sell",
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.perm_identity_outlined),
          label: "Profile",
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FreeAds"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () =>
                Navigator.pushNamed(context, RoutesConstant.cartRoute),
          )
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}
