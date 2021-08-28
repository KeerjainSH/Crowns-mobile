import 'package:crowns/constants/app_constants.dart';
import 'package:flutter/material.dart';

Container buildDetail(String text, String value) {
  return Container(
    margin: EdgeInsets.only(bottom: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 13),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 13),
        ),
      ],
    ),
  );
}

final dividerLine = Container(
  color: ColorConstants.grey,
  height: 1,
  margin: EdgeInsets.symmetric(vertical: 4),
  width: double.infinity,
);