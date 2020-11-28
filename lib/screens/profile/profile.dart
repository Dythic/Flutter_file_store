import 'package:flutter/material.dart';

import 'package:flutter_file_store/constants/routes_constant.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
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
      ),
    );
  }
}
