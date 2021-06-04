import 'package:flutter/material.dart';

import 'package:crowns/utils/color_constants.dart';

class UkuranBajuFormField extends StatelessWidget {
  final String label;

  UkuranBajuFormField({this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              this.label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: ColorConstants.darkGrey,
              ),
            ),
          ),
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
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
