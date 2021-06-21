import 'package:flutter/material.dart';

import 'package:crowns/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final int lines;

  CustomTextField(this.lines);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      padding: EdgeInsets.only(left: 11),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          keyboardType: TextInputType.multiline,
          minLines: 4,
          maxLines: null,
        ),
      ),
    );
  }
}
