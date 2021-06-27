import 'package:crowns/screens/auth/register.dart';
import 'package:crowns/screens/catalog/kreasi.dart';
import 'package:crowns/screens/profile/edit_profile.dart';
import 'package:crowns/screens/pesanan/pesanan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:crowns/screens/auth/login.dart';
import 'package:crowns/screens/home/home.dart';
import 'package:crowns/screens/catalog/catalog.dart';
import 'package:crowns/screens/pesanan/detail_pesanan.dart';
import 'package:crowns/screens/pesanan/update_alamat.dart';
import 'package:crowns/screens/pembayaran/detail_pembayaran.dart';
import 'package:crowns/screens/pembayaran/pembayaran.dart';
import 'package:crowns/screens/pembayaran/menunggu_konfirmasi.dart';
import 'package:crowns/screens/pesanan/pilih_penjahit.dart';
import 'package:crowns/screens/profile/profile.dart';
import 'package:crowns/utils/constants.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RouteConstants.register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case RouteConstants.landingPage:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RouteConstants.catalog:
        return MaterialPageRoute(builder: (_) => CatalogScreen());
      case RouteConstants.detilPesanan:
        return MaterialPageRoute(builder: (_) => DetailPesananPage());
      case RouteConstants.isiAlamat:
        return MaterialPageRoute(builder: (_) => UpdateAlamatScreen());
      case RouteConstants.detilPembayaran:
        return MaterialPageRoute(builder: (_) => DetailPembayaranPage());
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
      case RouteConstants.pesanan:
        return MaterialPageRoute(builder: (_) => PesananScreen());
      case RouteConstants.kreasi:
        return MaterialPageRoute(builder: (_) => KreasiScreen());
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
