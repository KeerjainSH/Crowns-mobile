import 'package:crowns/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:crowns/constants/app_constants.dart';

class TransisiPesananScreen extends StatelessWidget {
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
        SizedBox(height: 10),
        Text(
          'Silakan menunggu penjahit untuk mengisi harga pesanan kamu',
          style: TextStyle(color: ColorConstants.darkGrey),
          textAlign: TextAlign.center,
        ),
      ],
    );

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteConstants.landingPage,
          (route) => false,
        );
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height -
                padding.top -
                padding.bottom,
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
                      CustomButton(
                        text: 'Home',
                        callback: () => Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouteConstants.landingPage,
                            (route) => false),
                      ),
                      SizedBox(width: 20),
                      CustomButton(
                        text: 'Pesanan',
                        callback: () => Navigator.pushNamedAndRemoveUntil(
                            context, RouteConstants.pesanan, (route) => false),
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
