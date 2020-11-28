import 'package:flutter/material.dart';

import 'package:flutter_file_store/routes.dart';

import 'package:flutter_file_store/constants/routes_constant.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FreeAds',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
      ),
      onGenerateRoute: RoutesGenerator.generateRoute,
      initialRoute: RoutesConstant.marketRoute,
    );
  }
}
