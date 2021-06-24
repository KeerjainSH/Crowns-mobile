import 'package:crowns/screens/edit_profile.dart';
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
import 'package:crowns/screens/menunggu_konfirmasi.dart';
import 'package:crowns/screens/pilih_penjahit.dart';
import 'package:crowns/screens/profile.dart';
import 'package:crowns/utils/constants.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RouteConstants.register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case RouteConstants.landingPage:
        return MaterialPageRoute(builder: (_) => LandingPage());
      case RouteConstants.catalog:
        return MaterialPageRoute(builder: (_) => CatalogScreen());
      case RouteConstants.detilPesanan:
        return MaterialPageRoute(builder: (_) => DetilPesananPage());
      case RouteConstants.isiAlamat:
        return MaterialPageRoute(builder: (_) => IsiAlamatPage());
      case RouteConstants.detilPembayaran:
        return MaterialPageRoute(builder: (_) => DetilPembayaranPage());
      case RouteConstants.pembayarn:
        return MaterialPageRoute(builder: (_) => PembayaranPage());
      case RouteConstants.pilihPenjahit:
        return MaterialPageRoute(builder: (_) => PilihPenjahitScreen());
      case RouteConstants.menungguKonfirmasi:
        return MaterialPageRoute(builder: (_) => MenungguKonfirmasiScreen());
      case RouteConstants.profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case RouteConstants.editProfile:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());
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
