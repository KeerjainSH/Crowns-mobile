import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:crowns/screens/auth/login.dart';
import 'package:crowns/screens/auth/register.dart';
import 'package:crowns/screens/landing_page.dart';
import 'package:crowns/screens/catalog.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => LandingPage());
      case '/catalog':
        return MaterialPageRoute(builder: (_) => CataloPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
