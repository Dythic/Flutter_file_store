import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_file_store/panier.dart';

import 'accueil.dart';
import 'acheter.dart';
import 'vendre.dart';
import 'profil.dart';
import 'panier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FreeAds',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    AccueilPage(),
    AcheterPage(),
    VendrePage(),
    ProfilPage()
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
          title: new Text("Accueil"),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.add_shopping_cart_outlined),
          title: new Text("Acheter"),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.local_offer_outlined),
          title: new Text("Vendre"),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.perm_identity_outlined),
          title: new Text("Profil"),
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
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PanierPage()));
            },
          )
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}
