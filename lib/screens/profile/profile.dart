import 'package:flutter/material.dart';

import 'package:flutter_file_store/constants/routes_constant.dart';

import 'package:flutter_file_store/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: FutureBuilder(
        future: context.watch<UserProvider>().username,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());
        else if (snapshot.hasData) {
          if (snapshot.data != "") {
            return new Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hello ${snapshot.data}!",
                    style: TextStyle(fontSize: 30),
                  ),
                  RaisedButton(
                    color: Colors.black,
                    onPressed: () async {
                      final userProvider = Provider.of<UserProvider>(context, listen: false);
                      final res = await userProvider.logout();
                      print("logout: $res");
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: new Text(
                      "Logout",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return new Center(
              child: new ButtonBar(
                mainAxisSize: MainAxisSize.max,
                alignment: MainAxisAlignment.center,
                buttonMinWidth: 320.0,
                buttonHeight: 50.0,
                overflowButtonSpacing: 10,
                children: <Widget>[
                  new RaisedButton(
                    color: Colors.black,
                    onPressed: () => Navigator.pushNamed(context, RoutesConstant.loginRoute),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: new Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  new RaisedButton(
                    color: Colors.white,
                    onPressed: () => Navigator.pushNamed(context, RoutesConstant.registerRoute),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: new Text(
                      "Register",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            );
          }
        } else if (snapshot.hasError)
            return Text("ERROR: ${snapshot.error}");
        else
          return Text('');
        },
      )
    );
  }
}
