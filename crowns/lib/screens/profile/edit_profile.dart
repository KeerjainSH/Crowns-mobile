import 'package:crowns/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:crowns/widgets/widgets.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    final appBar = AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
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
              color: Colors.black,
            ),
          ),
        ),
      ],
      title: Text(
        'Edit Profile',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: ColorConstants.softBlue,
      elevation: 0,
    );

    Align buildLabel(String text) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      );
    }

    InputDecoration buildDecoration() {
      var border = OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(16),
        ),
        borderSide: BorderSide(width: 0, style: BorderStyle.none),
      );
      return InputDecoration(
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        errorBorder: border,
        disabledBorder: border,
        filled: true,
        isCollapsed: true,
        fillColor: ColorConstants.softGrey,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: ColorConstants.hintColor,
        ),
      );
    }

    final formField = Column(
      children: [
        buildLabel('label'),
        SizedBox(height: 9),
        TextFormField(
          validator: (value) => value == '' ? 'required' : null,
          decoration: buildDecoration(),
        ),
        SizedBox(height: 15),
      ],
    );

    final formInput = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
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
        child: Column(
          children: [
            formField,
            formField,
            formField,
            formField,
            formField,
            formField,
            formField,
          ],
        ),
      ),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                formInput,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
