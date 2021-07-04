import 'package:crowns/modules/auth/models/user_register.dart';
import 'package:crowns/modules/auth/providers/auth_provider.dart';
import 'package:crowns/widgets/app_widgets.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:flutter/material.dart';

import 'package:crowns/constants/app_constants.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = new GlobalKey<FormState>();

  UserRegister userRegister = UserRegister();

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    AuthProvider auth = Provider.of<AuthProvider>(context);

    final usernameField = TextFormField(
      onSaved: (value) => userRegister.username = value!,
      validator: (value) => value == '' ? 'wajib diisi' : null,
    );

    final passwordField = TextFormField(
      // obscureText: true,
      onSaved: (value) => userRegister.password = value!,
      validator: (value) => value == '' ? 'wajib diisi' : null,
    );

    final confirmPasswordField = TextFormField(
      // obscureText: true,
      onSaved: (value) => userRegister.password = value!,
      validator: (value) {
        if (value == '') return 'wajib diisi';
        // else if (value != userRegister.password) return 'password harus sama';
        return null;
      },
    );
    final emailField = Column(
      children: [
        buildFormLabel(context, 'Email'),
        SizedBox(height: 9),
        TextFormField(
          onSaved: (value) => userRegister.email = value!,
          validator: (value) => value == '' ? 'wajib diisi' : null,
        ),
        SizedBox(height: 15),
      ],
    );

    final namaField = Column(
      children: [
        buildFormLabel(context, 'Nama'),
        SizedBox(height: 9),
        TextFormField(
          onSaved: (value) => userRegister.nama = value!,
          validator: (value) => value == '' ? 'wajib diisi' : null,
        ),
        SizedBox(height: 15),
      ],
    );

    final kelaminField = Column(
      children: [
        buildFormLabel(context, 'Jenis Kelamin'),
        SizedBox(height: 9),
        TextFormField(
          onSaved: (value) => userRegister.jenis_kelamin = value!,
          validator: (value) => value == '' ? 'Please enter username' : null,
        ),
        SizedBox(height: 15),
      ],
    );

    final nohpField = Column(
      children: [
        buildFormLabel(context, 'No HP'),
        SizedBox(height: 9),
        TextFormField(
          onSaved: (value) => userRegister.no_hp = value!,
          validator: (value) => value == '' ? 'Please enter username' : null,
        ),
        SizedBox(height: 15),
      ],
    );

    final lahirField = Column(
      children: [
        buildFormLabel(context, 'Tanggal Lahir'),
        SizedBox(height: 9),
        TextFormField(
          onSaved: (value) => userRegister.tanggal_lahir = value!,
          validator: (value) => value == '' ? 'Please enter username' : null,
        ),
        SizedBox(height: 15),
      ],
    );

    final kodeposField = Column(
      children: [
        buildFormLabel(context, 'Kode Pos'),
        SizedBox(height: 9),
        TextFormField(
          onSaved: (value) => userRegister.kodepos = value!,
          validator: (value) => value == '' ? 'Please enter username' : null,
        ),
        SizedBox(height: 15),
      ],
    );

    final kecamatanField = Column(
      children: [
        buildFormLabel(context, 'Kecamatan'),
        SizedBox(height: 9),
        TextFormField(
          onSaved: (value) => userRegister.kecamatan = value!,
          validator: (value) => value == '' ? 'Please enter username' : null,
        ),
        SizedBox(height: 15),
      ],
    );

    final kotaField = Column(
      children: [
        buildFormLabel(context, 'Kota'),
        SizedBox(height: 9),
        TextFormField(
          onSaved: (value) => userRegister.kota = value!,
          validator: (value) => value == '' ? 'wajib diisi' : null,
        ),
        SizedBox(height: 15),
      ],
    );

    final provinsiField = Column(
      children: [
        buildFormLabel(context, 'Provinsi'),
        SizedBox(height: 9),
        TextFormField(
          onSaved: (value) => userRegister.provinsi = value!,
          validator: (value) => value == '' ? 'wajib diisi' : null,
        ),
        SizedBox(height: 15),
      ],
    );

    final alamatField = Column(
      children: [
        buildFormLabel(context, 'Alamat'),
        SizedBox(height: 9),
        TextFormField(
          onSaved: (value) => userRegister.alamat = value!,
          validator: (value) => value == '' ? 'wajib diisi' : null,
        ),
        SizedBox(height: 15),
      ],
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
            buildFormLabel(context, 'Username'),
            SizedBox(height: 9),
            usernameField,
            SizedBox(height: 15),
            buildFormLabel(context, 'Password'),
            SizedBox(height: 9),
            passwordField,
            SizedBox(height: 15),
            buildFormLabel(context, 'Confirm Password'),
            SizedBox(height: 9),
            confirmPasswordField,
            SizedBox(height: 15),
            kelaminField,
            nohpField,
            lahirField,
            emailField,
            namaField,
            alamatField,
            kecamatanField,
            kotaField,
            provinsiField,
            kodeposField,
          ],
        ),
      ),
    );

    var doRegister = () {
      final FormState? form = formKey.currentState;

      if (form!.validate()) {
        form.save();

        final Future<Map<String, dynamic>> successfulMessage =
            auth.register(userRegister);

        successfulMessage.then((response) {
          if (response['status']) {
            Navigator.pushNamed(context, RouteConstants.login);
          } else {
            print(response['message']);
            print(response['data']);
          }
        });
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
        body: Container(
          height:
              MediaQuery.of(context).size.height - padding.top - padding.bottom,
          color: ColorConstants.backgroundColor,
          child: LayoutBuilder(builder: (context, constraint) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.3,
                        child: Image.asset(ImageConstants.appLogo),
                      ),
                    ),
                    formInput,
                    SizedBox(height: 20),
                    registerButton,
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
