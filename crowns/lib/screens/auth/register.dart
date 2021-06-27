import 'package:crowns/provider/auth/auth_provider.dart';
import 'package:crowns/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:crowns/utils/constants.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = new GlobalKey<FormState>();

  String _username = '', _password = '';

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    AuthProvider auth = Provider.of<AuthProvider>(context);

    final usernameField = TextFormField(
      onSaved: (value) => _username = value!,
      validator: (value) => value == '' ? 'Please enter username' : null,
      decoration: buildInputDecoration('Enter username'),
    );

    final passwordField = TextFormField(
      obscureText: true,
      onSaved: (value) => _password = value!,
      validator: (value) => value == '' ? 'Please enter password' : null,
      decoration: buildInputDecoration('Enter password'),
    );

    final confirmPasswordField = TextFormField(
      obscureText: true,
      onSaved: (value) => _password = value!,
      validator: (value) {
        if (value == '')
          return 'Please enter confirm password';
        else if (value != _password) return 'Password not same';
        return null;
      },
      decoration: buildInputDecoration('Enter password'),
    );

    Align buildLabel(String text) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      );
    }

    final formInput = Container(
      padding: EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 24,
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
      child: Form(
        key: formKey,
        child: Column(
          children: [
            buildLabel('Username'),
            SizedBox(height: 9),
            usernameField,
            SizedBox(height: 15),
            buildLabel('Password'),
            SizedBox(height: 9),
            passwordField,
            SizedBox(height: 15),
            buildLabel('Confirm Password'),
            SizedBox(height: 9),
            confirmPasswordField,
          ],
        ),
      ),
    );

    var doRegister = () {
      final FormState? form = formKey.currentState;

      if (form!.validate()) {
        form.save();
      }
    };

    final registerButton = ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 125, height: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(fontFamily: 'SFProDisplay'),
          primary: ColorConstants.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(180.0),
          ),
        ),
        onPressed: doRegister,
        child: Text(
          'daftar',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                padding.top -
                padding.bottom,
            color: ColorConstants.backgroundColor,
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(ImageConstants.appLogo),
                  formInput,
                  registerButton,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
