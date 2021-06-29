import 'package:crowns/modules/auth/providers/auth_provider.dart';
import 'package:crowns/modules/auth/screens/login.dart';
import 'package:crowns/modules/catalog/providers/catalog_provider.dart';
import 'package:crowns/modules/home/providers/home_provider.dart';
import 'package:crowns/modules/pesanan/providers/desain_custom_provider.dart';
import 'package:crowns/modules/pesanan/providers/detail_pesanan_provider.dart';
import 'package:crowns/modules/auth/providers/user_provider.dart';
import 'package:crowns/modules/pesanan/providers/penjahit_provider.dart';
import 'package:crowns/modules/profile/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowns/config/themes/app_theme.dart';

import 'package:crowns/config/routes/routes.dart';

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
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => PenjahitProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: CustomRouter.generateRoute,
        theme: appTheme,
        home: LoginScreen(),
      ),
    );
  }
}
