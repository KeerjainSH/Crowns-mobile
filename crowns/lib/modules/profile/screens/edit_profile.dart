import 'package:crowns/constants/app_constants.dart';
import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/profile/providers/profile_provider.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final formKey = new GlobalKey<FormState>();

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

    Column buildFormItem(String label, String value) {
      return Column(
        children: [
          buildFormLabel(context, label),
          SizedBox(height: 9),
          TextFormField(
            style: Theme.of(context).textTheme.bodyText2,
            initialValue: value,
            enabled: false,
            validator: (value) => value == '' ? 'required' : null,
          ),
          SizedBox(height: 15),
        ],
      );
    }

    final formInput = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            offset: Offset(-1, 2),
            color: ColorConstants.softGrey,
          )
        ],
      ),
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: profileProvider.profileStatus == RequestStatus.Fetched
            ? Column(
                children: [
                  buildFormItem('Username', profileProvider.profile.username),
                  buildFormItem('Email', profileProvider.profile.email),
                  buildFormItem('Nama', profileProvider.profile.nama),
                  buildFormItem(
                      'Jenis kelamin', profileProvider.profile.jenis_kelamin),
                  buildFormItem('No HP', profileProvider.profile.no_hp),
                  buildFormItem(
                      'Tanggal Lahir', profileProvider.profile.tanggal_lahir),
                  buildFormItem('Kode Pos', profileProvider.profile.kodepos),
                  buildFormItem('Alamat', profileProvider.profile.alamat),
                  buildFormItem('Kecamatan', profileProvider.profile.kecamatan),
                  buildFormItem('Kota', profileProvider.profile.kota),
                  buildFormItem('Provinsi', profileProvider.profile.provinsi),
                ],
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.softGrey,
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
