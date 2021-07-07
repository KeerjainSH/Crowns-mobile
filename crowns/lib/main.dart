import 'package:crowns/modules/auth/providers/auth_provider.dart';
import 'package:crowns/modules/auth/screens/login.dart';
import 'package:crowns/modules/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crowns/modules/catalog/providers/catalog_provider.dart';
import 'package:crowns/modules/pesanan/providers/alamat_provider.dart';
import 'package:crowns/modules/pesanan/providers/desain_custom_provider.dart';
import 'package:crowns/modules/pesanan/providers/pesanan_provider.dart';
import 'package:crowns/modules/auth/providers/user_provider.dart';
import 'package:crowns/modules/pesanan/providers/penjahit_provider.dart';
import 'package:crowns/modules/profile/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crowns/config/themes/app_theme.dart';

import 'package:crowns/config/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  runApp(MyApp(token != null));
}

class MyApp extends StatelessWidget {
  bool isLogin;

  MyApp(this.isLogin);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => PesananProvider()),
        ChangeNotifierProvider(create: (_) => DesainCustomProvider()),
        ChangeNotifierProvider(create: (_) => CatalogProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => PenjahitProvider()),
        ChangeNotifierProvider(create: (_) => PesananProvider()),
        ChangeNotifierProvider(create: (_) => AlamatProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: CustomRouter.generateRoute,
        theme: appTheme,
        home: isLogin ? HomeScreen() : LoginScreen(),
      ),
    );
  }
}
