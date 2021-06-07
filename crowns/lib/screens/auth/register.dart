import 'package:flutter/material.dart';

import 'package:crowns/widgets/auth_text_form_field.dart';

import 'package:crowns/utils/image_constants.dart';
import 'package:crowns/utils/color_constants.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _textName = TextEditingController();
  final _textEmail = TextEditingController();
  final _textPassword = TextEditingController();
  bool _validateName = true;
  bool _validateEmail = true;
  bool _validatePassword = true;

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
                    AuthTextFormField(
                      label: 'Nama Pengguna',
                      controller: _textName,
                      validator: _validateName,
                    ),
                    SizedBox(height: 15),
                    AuthTextFormField(
                      label: 'Email',
                      controller: _textEmail,
                      validator: _validateEmail,
                    ),
                    SizedBox(height: 15),
                    AuthTextFormField(
                      label: 'Password',
                      controller: _textPassword,
                      validator: _validatePassword,
                    ),
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
                  onPressed: () {
                    setState(() {
                      _textName.text.isEmpty
                          ? _validateName = false
                          : _validateName = true;
                      _textEmail.text.isEmpty
                          ? _validateEmail = false
                          : _validateEmail = true;
                      _textPassword.text.isEmpty
                          ? _validatePassword = false
                          : _validatePassword = true;
                      if (_validateEmail && _validatePassword)
                        Navigator.pushNamed(context, '/login');
                    });
                  },
                  child: Text(
                    'daftar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
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
