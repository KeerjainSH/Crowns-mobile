import 'package:crowns/modules/auth/models/user.dart';
import 'package:crowns/modules/auth/providers/auth_provider.dart';
import 'package:crowns/modules/auth/providers/user_provider.dart';
import 'package:crowns/widgets/custom_button.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:flutter/material.dart';

import 'package:crowns/constants/app_constants.dart';
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
    );

    final passwordField = TextFormField(
      obscureText: true,
      onSaved: (value) => _password = value!,
      validator: (value) => value == '' ? 'Please enter password' : null,
    );

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
            buildFormLabel(context, 'Username'),
            SizedBox(height: 9),
            usernameField,
            SizedBox(height: 15),
            buildFormLabel(context, 'Password'),
            SizedBox(height: 9),
            passwordField,
          ],
        ),
      ),
    );

    final haveAccountQuestion = Container(
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

    var login = () {
      // Navigator.pushNamed(context, RouteConstants.landingPage);

      final FormState? form = formKey.currentState;

      if (form!.validate()) {
        form.save();

        final Future<Map<String, dynamic>> successfulMessage =
            auth.login(_username, _password);

        successfulMessage.then((response) {
          if (response['status']) {
            User user = response['user'];
            Provider.of<UserProvider>(context, listen: false).setUser(user);

            final snackBar = SnackBar(
              content: Text('Login berhasil'),
              backgroundColor: ColorConstants.black,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            Navigator.pushNamedAndRemoveUntil(
                context, RouteConstants.landingPage, (route) => false);
          } else {
            final snackBar = SnackBar(
              content: Text('Email atau password salah'),
              backgroundColor: ColorConstants.black,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        });
      }
    };

    return SafeArea(
      child: Scaffold(
        body: Container(
          height:
              MediaQuery.of(context).size.height - padding.top - padding.bottom,
          color: ColorConstants.backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: LayoutBuilder(
            builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(ImageConstants.appLogo),
                      formInput,
                      haveAccountQuestion,
                      auth.loggedInStatus == AuthStatus.Authenticating
                          ? CircularProgressIndicator()
                          : CustomButton(text: 'masuk', callback: login),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
