import 'package:flutter/material.dart';
import 'main.dart';

class Panier extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _drawer(),
      appBar: AppBar(
        title: Text("Panier"),
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
      ),
    );
  }
}
