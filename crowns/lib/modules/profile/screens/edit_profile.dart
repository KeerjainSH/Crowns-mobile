import 'package:crowns/constants/app_constants.dart';
import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/auth/models/user_register.dart';
import 'package:crowns/modules/profile/providers/profile_provider.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final formKey = new GlobalKey<FormState>();

  String _currKelamin = 'l';

  UserRegister userRegister = UserRegister();

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);

    final padding = MediaQuery.of(context).padding;

    final appBar = AppBar(
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_rounded,
          color: ColorConstants.black,
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.check,
              color: ColorConstants.black,
            ),
          ),
        ),
      ],
      title: Center(
        child: Text(
          'Edit Profile',
          style: TextStyle(color: ColorConstants.black),
        ),
      ),
      // backgroundColor: ColorConstants.softBlue,
      elevation: 0,
    );

    final usernameField = Column(
      children: [
        buildFormLabel(context, 'Username'),
        SizedBox(height: 9),
        TextFormField(
          initialValue: profileProvider.profile.username,
          style: TextStyle(fontSize: 14),
          onSaved: (value) => userRegister.username = value!,
          validator: (value) => value == '' ? 'wajib diisi' : null,
        ),
        SizedBox(height: 15),
      ],
    );

    final emailField = Column(
      children: [
        buildFormLabel(context, 'Email'),
        SizedBox(height: 9),
        TextFormField(
          initialValue: profileProvider.profile.email,
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
          initialValue: profileProvider.profile.nama,
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
          initialValue: profileProvider.profile.no_hp,
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
          initialValue: profileProvider.profile.tanggal_lahir,
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
          initialValue: profileProvider.profile.kodepos,
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
          initialValue: profileProvider.profile.kecamatan,
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
          initialValue: profileProvider.profile.kota,
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
          initialValue: profileProvider.profile.provinsi,
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
          initialValue: profileProvider.profile.alamat,
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
        appBar: appBar,
        body: profileProvider.profileStatus == RequestStatus.Fetched
            ? Container(
                height: MediaQuery.of(context).size.height -
                    padding.top -
                    padding.bottom,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        formInput,
                      ],
                    ),
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
