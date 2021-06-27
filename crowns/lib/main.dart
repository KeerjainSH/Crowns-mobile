import 'package:crowns/provider/auth/auth_provider.dart';
import 'package:crowns/provider/catalog/catalog_provider.dart';
import 'package:crowns/provider/home/home_provider.dart';
import 'package:crowns/provider/pesanan/desain_custom_provider.dart';
import 'package:crowns/provider/pesanan/detail_pesanan_provider.dart';
import 'package:crowns/provider/auth/user_provider.dart';
import 'package:crowns/screens/auth/login.dart';
import 'package:crowns/screens/pesanan/pesanan.dart';
import 'package:crowns/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider(create: (_) => DetailPesananProvider()),
        ChangeNotifierProvider(create: (_) => DesainCustomProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => CatalogProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: CustomRouter.generateRoute,
        theme: ThemeData(
          fontFamily: 'SFProDisplay',
        ),
        home: PesananScreen(),
      ),
    );
  }
}
