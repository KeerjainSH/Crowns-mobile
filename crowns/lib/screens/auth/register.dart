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
        color: ColorConstants.backgroundColor,
        height: double.infinity,
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(ImageConstants.appLogo),
              Container(
                padding: EdgeInsets.only(
                  left: 28,
                  right: 28,
                  top: 24,
                  bottom: 24,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0,
                      offset: Offset(0, 4),
                      blurRadius: 2,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    AuthTextFormField(label: 'Nama/Email Pengguna'),
                    SizedBox(height: 15),
                    AuthTextFormField(label: 'Email'),
                    SizedBox(height: 15),
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
