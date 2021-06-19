import 'package:crowns/screens/pilih_penjahit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:crowns/screens/auth/login.dart';
import 'package:crowns/screens/auth/register.dart';
import 'package:crowns/screens/landing_page.dart';
import 'package:crowns/screens/catalog.dart';
import 'package:crowns/screens/detil_pesanan.dart';
import 'package:crowns/screens/isi_alamat.dart';
import 'package:crowns/screens/detil_pembayaran.dart';
import 'package:crowns/screens/pembayaran.dart';

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
      case '/detil-pesanan':
        return MaterialPageRoute(builder: (_) => DetilPesananPage());
      case '/isi-alamat':
        return MaterialPageRoute(builder: (_) => IsiAlamatPage());
      case '/detil-pembayaran':
        return MaterialPageRoute(builder: (_) => DetilPembayaranPage());
      case '/pembayaran':
        return MaterialPageRoute(builder: (_) => PembayaranPage());
      case '/pilih-penjahit':
        return MaterialPageRoute(builder: (_) => PilihPenjahitScreen());
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
