import 'package:flutter/material.dart';

import 'package:crowns/utils/image_constants.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Image.asset(ImageConstants.appLogo)],
          ),
        ),
      ),
    );
  }
}
