import 'package:crowns/utils/color_constants.dart';
import 'package:crowns/utils/image_constants.dart';
import 'package:flutter/material.dart';

Container appHeader = Container(
  padding: EdgeInsets.symmetric(horizontal: 32),
  width: double.infinity,
  child: Image.asset(
    ImageConstants.appHeader,
    fit: BoxFit.cover,
  ),
);

InputDecoration buildInputDecoration(String hint) {
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
    fillColor: ColorConstants.grey,
    hintText: hint,
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    hintStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: ColorConstants.hintColor,
    ),
  );
}

Container buildHeadline(String text) {
  return Container(
    padding: EdgeInsets.only(left: 32),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
      ),
    ),
  );
}

Container buildHeadlineSub(String text) {
  return Container(
    padding: EdgeInsets.only(left: 32),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          color: ColorConstants.darkGrey,
          fontWeight: FontWeight.w400,
          fontSize: 13,
        ),
      ),
    ),
  );
}
