import 'package:flutter/material.dart';

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
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
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
