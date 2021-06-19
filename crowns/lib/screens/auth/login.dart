import 'package:crowns/models/user.dart';
import 'package:crowns/provider/auth_provider.dart';
import 'package:crowns/provider/user_provider.dart';
import 'package:crowns/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:crowns/utils/image_constants.dart';
import 'package:crowns/utils/color_constants.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            offset: Offset(0, 4),
            blurRadius: 1,
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
          ],
        ),
      ),
    );

    final register = Container(
      child: Column(
        children: [
          Text(
            'Belum memiliki akun?',
            style: TextStyle(
              fontSize: 12,
              color: ColorConstants.darkGrey,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Text(
              'Daftar Sekarang',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );

    var doLogin = () {
      Navigator.pushReplacementNamed(context, '/home');

      // final FormState? form = formKey.currentState;

      // if (form!.validate()) {
      //   form.save();

      //   final Future<Map<String, dynamic>> successfulMessage =
      //       auth.login(_username, _password);

      //   successfulMessage.then((response) {
      //     if (response['status']) {
      //       User user = response['user'];
      //       Provider.of<UserProvider>(context, listen: false).setUser(user);
      //       Navigator.pushReplacementNamed(context, '/');
      //     } else {
      //       print('Login gagal');
      //     }
      //   });
      // }
    };

    final loginButton = ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 125, height: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(fontFamily: 'SFProDisplay'),
          primary: ColorConstants.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(180.0),
          ),
        ),
        onPressed: doLogin,
        child: Text(
          'masuk',
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
                  register,
                  loginButton,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
