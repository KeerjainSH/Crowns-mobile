import 'package:crowns/models/user.dart';
import 'package:crowns/provider/auth_provider.dart';
import 'package:crowns/provider/user_provider.dart';
import 'package:crowns/screens/pilih_penjahit.dart';
import 'package:crowns/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:crowns/screens/auth/login.dart';
import 'package:crowns/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: CustomRouter.generateRoute,
        theme: ThemeData(
          fontFamily: 'SFProDisplay',
        ),
        home: PilihPenjahitScreen(),
      ),
    );
  }
}
