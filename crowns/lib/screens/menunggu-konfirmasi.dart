import 'package:flutter/material.dart';

import 'package:crowns/widgets/widgets.dart';

import 'package:crowns/utils/constants.dart';

class MenungguKonfirmasiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;

    final content = Text(
      'Menunggu Konfirmasi Pembayaran',
      style: TextStyle(
        color: ColorConstants.darkGrey,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: Container(
          height:
              MediaQuery.of(context).size.height - padding.top - padding.bottom,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.width * 0.7,
                  child: Image.asset(ImageConstants.appLogo),
                ),
                SizedBox(height: 25),
                content,
                SizedBox(height: 25),
                buildButton(context, 'Kembali', RouteConstants.landingPage),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
