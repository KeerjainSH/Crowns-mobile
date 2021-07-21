import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:crowns/constants/app_constants.dart';

import '../../modules/auth/screens/login.dart';
import '../../modules/auth/screens/register.dart';
import '../../modules/catalog/screens/catalog.dart';
import '../../modules/catalog/screens/kreasi.dart';
import '../../modules/home.dart';
import '../../modules/pembayaran/screens/detail_pembayaran.dart';
import '../../modules/pembayaran/screens/menunggu_konfirmasi.dart';
import '../../modules/pembayaran/screens/pembayaran.dart';
import '../../modules/pesanan/screens/detail_pesanan.dart';
import '../../modules/pesanan/screens/pesanan.dart';
import '../../modules/pesanan/screens/pilih_penjahit.dart';
import '../../modules/pesanan/screens/update_alamat.dart';
import '../../modules/profile/screens/edit_profile.dart';
import '../../modules/profile/screens/profile.dart';

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
