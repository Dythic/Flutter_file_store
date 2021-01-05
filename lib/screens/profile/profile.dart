import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_file_store/constants/routes_constant.dart';

import 'package:flutter_file_store/providers/picker_provider.dart';
import 'package:flutter_file_store/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Center(
            child: SingleChildScrollView(
                child: FutureBuilder(
          future: context.watch<UserProvider>().isLogged(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            else if (snapshot.hasData) {
              if (snapshot.data != false) {
                return new ProfileModifier(snapshot: snapshot);
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
                        onPressed: () => Navigator.pushNamed(
                            context, RoutesConstant.loginRoute),
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
                        onPressed: () => Navigator.pushNamed(
                            context, RoutesConstant.registerRoute),
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
        ))));
  }
}

class ProfileModifier extends StatefulWidget {
  final AsyncSnapshot snapshot;
  ProfileModifier({Key key, @required this.snapshot}) : super(key: key);

  @override
  _ProfileModifierState createState() => _ProfileModifierState(snapshot);
}

class _ProfileModifierState extends State<ProfileModifier> {
  final _formKey = GlobalKey<FormState>();
  AsyncSnapshot snapshot;
  _ProfileModifierState(this.snapshot);

  @override
  Widget build(BuildContext context) {
    String username;
    String email;
    final userProvider = Provider.of<UserProvider>(context);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 40),
            child: GestureDetector(
              onTap: () {
                PickerProvider().getImagePathFromGallery().then((result) {
                  if (result != null) {
                    final res = userProvider.setImageProfile(result);
                    print('imagePath: $res');
                  }
                });
              },
              child: CircleAvatar(
                radius: 53,
                backgroundColor: Colors.white,
                child: userProvider.user.imageProfile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          File(userProvider.user.imageProfile),
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          ),
          Container(
            child: Text(
              "Hello ${userProvider.user.username}!",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: 54,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    initialValue: userProvider.user.username,
                    onSaved: (String value) {
                      username = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Username can\t be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Change your username",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: 54,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    initialValue: userProvider.user.email,
                    onSaved: (String value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value.isEmpty ||
                          !value.contains("@") ||
                          !value.contains(".")) {
                        return 'Invalid email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Change your email",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: 54,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ButtonTheme(
                    minWidth: 200.0,
                    height: 50.0,
                    child: RaisedButton(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          final res =
                              await userProvider.setUser(email, username);
                          print("set user: $res");
                        }
                      },
                      child: Text(
                        'Edit my profile',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: 54,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ButtonTheme(
                    minWidth: 200.0,
                    height: 50.0,
                    child: RaisedButton(
                      color: Colors.black,
                      onPressed: () async {
                        final userProvider =
                            Provider.of<UserProvider>(context, listen: false);
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
