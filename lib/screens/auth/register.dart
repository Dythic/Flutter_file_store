import 'package:flutter/material.dart';

import 'package:flutter_file_store/providers/user_provider.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        actions: <Widget>[],
      ),
      body: RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
  RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String email;
    String password;
    String name;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: 54,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    onSaved: (String value) {
                      name = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Username can\'t be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter a username",
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
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: 54,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
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
                      hintText: "Enter your email",
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
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: 54,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    onSaved: (String value) {
                      password = value;
                    },
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty || value.length < 8) {
                        return 'Password length must be at least 8';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter a password",
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
                    obscureText: true,
                    validator: (value) {
                      if (value != password) {
                        return 'Passwords are differents';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Repeat password",
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
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      onPressed: () async {
                        _formKey.currentState.save();
                        if (_formKey.currentState.validate()) {
                          final userProvider =
                              Provider.of<UserProvider>(context, listen: false);
                          final res = await userProvider.register(
                              email, password, name);
                          print("register: $res");
                          if (res == true) Navigator.pop(context);
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 20, color: Colors.black),
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
