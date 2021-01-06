import 'package:flutter/material.dart';
import 'package:flutter_file_store/routes.dart';
import 'package:flutter_file_store/constants/routes_constant.dart';

import 'package:flutter_file_store/providers/picker_provider.dart';
import 'package:flutter_file_store/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        Provider(create: (context) => PickerProvider())
      ],
      child: MyApp(),
    ),
  );
}

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
