import 'package:flutter/material.dart';

import 'package:crowns/widgets/widgets.dart';
import 'package:crowns/utils/constants.dart';

class MenungguKonfirmasiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;

    final content = Column(
      children: [
        Text(
          'Terimakasih sudah melakukan pesanan',
          style: TextStyle(
            // color: ColorConstants.bla,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Kamu bisa melihat status pesanan pada menu cart',
          style: TextStyle(color: ColorConstants.darkGrey),
        ),
      ],
    );

    return SafeArea(
      child: Scaffold(
        body: Container(
          height:
              MediaQuery.of(context).size.height - padding.top - padding.bottom,
          padding: EdgeInsets.symmetric(horizontal: 32),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildButton(context, 'Home', RouteConstants.landingPage),
                    SizedBox(width: 20),
                    buildButton(context, 'Cart', RouteConstants.landingPage),
                  ],
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
