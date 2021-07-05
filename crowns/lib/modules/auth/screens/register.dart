import 'package:crowns/modules/auth/models/user_register.dart';
import 'package:crowns/modules/auth/providers/auth_provider.dart';
import 'package:crowns/widgets/app_widgets.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'package:crowns/constants/app_constants.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = new GlobalKey<FormState>();

  String _currKelamin = 'l';

  UserRegister userRegister = UserRegister();

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    AuthProvider auth = Provider.of<AuthProvider>(context);

    final usernameField = Column(
      children: [
        buildFormLabel(context, 'Username'),
        SizedBox(height: 9),
        TextFormField(
          style: TextStyle(fontSize: 14),
          onSaved: (value) => userRegister.username = value!,
          validator: (value) => value == '' ? 'wajib diisi' : null,
        ),
        SizedBox(height: 15),
      ],
    );

    final passwordField = Column(
      children: [
        buildFormLabel(context, 'Email'),
        SizedBox(height: 9),
        TextFormField(
          style: TextStyle(fontSize: 14),
          obscureText: true,
          onSaved: (value) => userRegister.password = value!,
          validator: (value) => value == '' ? 'wajib diisi' : null,
        ),
        SizedBox(height: 15),
      ],
    );

    final confirmPasswordField = Column(
      children: [
        buildFormLabel(context, 'Konfirmasi Password'),
        SizedBox(height: 9),
        TextFormField(
          style: TextStyle(fontSize: 14),
          obscureText: true,
          onSaved: (value) => userRegister.password = value!,
          validator: (value) {
            if (value == '') return 'wajib diisi';
            // else if (value != userRegister.password) return 'password harus sama';
            return null;
          },
        ),
        SizedBox(height: 15),
      ],
    );

    final emailField = Column(
      children: [
        buildFormLabel(context, 'Email'),
        SizedBox(height: 9),
        TextFormField(
          style: TextStyle(fontSize: 14),
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
          style: TextStyle(fontSize: 14),
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
        FormField(builder: (FormFieldState state) {
          return InputDecorator(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                // style: TextStyle(fontSize: 18 ),
                value: _currKelamin,
                isDense: true,
                onChanged: (String? value) {
                  setState(() {
                    userRegister.jenis_kelamin = value!;
                    _currKelamin = value;
                    state.didChange(value);
                  });
                },
                items: ['l', 'p'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        }),
        SizedBox(height: 15),
      ],
    );

    final nohpField = Column(
      children: [
        buildFormLabel(context, 'No HP'),
        SizedBox(height: 9),
        TextFormField(
          style: TextStyle(fontSize: 14),
          keyboardType: TextInputType.number,
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
        DateTimePicker(
          type: DateTimePickerType.date,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          style: TextStyle(fontSize: 13),
          onSaved: (value) => userRegister.tanggal_lahir = value!,
          validator: (value) => value == '' ? 'harus diisi' : null,
        ),
        SizedBox(height: 15),
      ],
    );

    final kodeposField = Column(
      children: [
        buildFormLabel(context, 'Kode Pos'),
        SizedBox(height: 9),
        TextFormField(
          style: TextStyle(fontSize: 14),
          keyboardType: TextInputType.number,
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
          style: TextStyle(fontSize: 14),
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
          style: TextStyle(fontSize: 14),
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
          style: TextStyle(fontSize: 14),
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
          style: TextStyle(fontSize: 14),
          onSaved: (value) => userRegister.alamat = value!,
          validator: (value) => value == '' ? 'wajib diisi' : null,
        ),
        SizedBox(height: 15),
      ],
    );

    final formInput = Container(
      padding: EdgeInsets.symmetric(
        horizontal: appPadding,
        vertical: appPadding,
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
            namaField,
            emailField,
            usernameField,
            passwordField,
            confirmPasswordField,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: kelaminField),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Expanded(child: lahirField),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: alamatField),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Expanded(child: kecamatanField),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: kotaField),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Expanded(child: provinsiField),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: nohpField),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Expanded(child: kodeposField),
              ],
            ),
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
                padding: EdgeInsets.symmetric(horizontal: appPadding),
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
                    SizedBox(height: 40),
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
