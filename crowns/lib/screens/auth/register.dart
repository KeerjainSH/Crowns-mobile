import 'package:flutter/material.dart';

import 'package:crowns/widgets/auth_text_form_field.dart';

import 'package:crowns/utils/image_constants.dart';
import 'package:crowns/utils/color_constants.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(ImageConstants.appLogo),
              Container(
                padding: EdgeInsets.only(left: 28, right: 28),
                child: Column(
                  children: [
                    AuthTextFormField(label: 'Nama/Email Pengguna'),
                    AuthTextFormField(label: 'Email'),
                    AuthTextFormField(label: 'Password'),
                  ],
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 125, height: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontFamily: 'SFProDisplay'),
                    primary: ColorConstants.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(180.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'daftar',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset(ImageConstants.googleLogo),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset(ImageConstants.facebookLogo),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
