import 'package:flutter/material.dart';

import 'package:flutter_file_store/providers/user_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: <Widget>[],
      ),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String email;
    String password;
    String error = "";
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
                      email = value;
                    },
                    validator: (value) {
                      if (value.isEmpty ||
                          !value.contains("@") ||
                          !value.contains(".")) {
                        return 'Invalid email';
                      }
                      if (error.isNotEmpty) {
                        return (error);
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
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
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
                      if (error.isNotEmpty) {
                        return (error);
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your password",
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
                        error = "";
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          final userProvider =
                              Provider.of<UserProvider>(context, listen: false);
                          final res = await userProvider.login(email, password);
                          print("login: $res");
                          if (res == true)
                            Navigator.pop(context);
                          else {
                            error = "Invalid email or password";
                            _formKey.currentState.validate();
                          }
                        }
                      },
                      child: Text(
                        'Login',
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
