import 'package:flutter/material.dart';

import 'package:flutter_file_store/screens/market.dart';
import 'package:flutter_file_store/screens/market/cart.dart';
import 'package:flutter_file_store/screens/auth/login.dart';
import 'package:flutter_file_store/screens/auth/register.dart';

import 'package:flutter_file_store/constants/routes_constant.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstant.marketRoute:
        return MaterialPageRoute(builder: (_) => Market());
      case RoutesConstant.cartRoute:
        return MaterialPageRoute(builder: (_) => CartPage());
      case RoutesConstant.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case RoutesConstant.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('ERROR'),
        ),
        body: Center(
          child: Text('This is not a valid route.'),
        ),
      );
    });
  }
}