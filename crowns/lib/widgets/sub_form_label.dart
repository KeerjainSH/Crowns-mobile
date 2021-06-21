import 'package:flutter/material.dart';

import 'package:crowns/utils/constants.dart';

class SubFormLabel extends StatelessWidget {
  final String text;

  SubFormLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 13,
        color: ColorConstants.darkGrey,
      ),
    );
  }
}
