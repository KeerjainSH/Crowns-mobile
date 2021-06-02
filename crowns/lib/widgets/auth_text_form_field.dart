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
          Align(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Masukkan ${this.label} Anda',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: ColorConstants.hintColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
