import 'package:flutter/material.dart';

import 'package:crowns/utils/color_constants.dart';

class AuthTextFormField extends StatelessWidget {
  final String label = "Nama/Email Pengguna";
  final String hint = "Masukkan Nama/Email Pengguna Anda";

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
                hintText: this.hint,
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
