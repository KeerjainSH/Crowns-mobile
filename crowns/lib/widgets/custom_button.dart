import 'package:flutter/material.dart';

import 'package:crowns/utils/color_constants.dart';

class CustomButton extends StatelessWidget {
  final String text;

  CustomButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: 125,
          height: 40,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontFamily: 'SFProDisplay'),
            primary: ColorConstants.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(180.0),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/isi-alamat');
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
