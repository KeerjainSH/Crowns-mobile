import 'package:flutter/material.dart';

import 'package:crowns/utils/color_constants.dart';

class AuthTextFormField extends StatelessWidget {
  final String label;

  AuthTextFormField({this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              this.label,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 9),
          Container(
            decoration: BoxDecoration(
              color: ColorConstants.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 25,
            padding: EdgeInsets.only(left: 11),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextFormField(
                obscureText: label == 'Password' ? true : false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Masukkan ${this.label} Anda',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: ColorConstants.hintColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
