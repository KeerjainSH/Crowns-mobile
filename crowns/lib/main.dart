import 'package:flutter/material.dart';

import 'package:crowns/screens/auth/login.dart';
import 'package:crowns/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: CustomRouter.generateRoute,
      theme: ThemeData(
        fontFamily: 'SFProDisplay',
      ),
      home: LoginScreen(),
    );
  }
}
