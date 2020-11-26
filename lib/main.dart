import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

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
        primaryColor: Colors.blue,
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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget _drawer() {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text("Test"),
            accountEmail: new Text("Test@test.fr"),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _gridList() {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(100, (index) {
        return Container(
          child: Card(
            color: Colors.grey,
          ),
        );
      }),
    );
  }

  Widget _bottomNavifationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: "Panier",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _drawer(),
      appBar: AppBar(
        title: Text("Main Page"),
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
      ),
      body: _gridList(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: _bottomNavifationBar(),
    );
  }
}
