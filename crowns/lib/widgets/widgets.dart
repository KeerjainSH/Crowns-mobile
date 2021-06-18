import 'package:crowns/utils/color_constants.dart';
import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String hint) {
  return InputDecoration(
    filled: true,
    isCollapsed: true,
    // border: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(8),
    //   borderSide: BorderSide(color: ColorConstants.grey),
    // ),
    // focusedBorder: OutlineInputBorder(
    //   borderSide: BorderSide(color: Colors.green),
    // ),
    // enabledBorder: OutlineInputBorder(
    //   borderSide: BorderSide(color: Colors.green),
    // ),
    // errorBorder: OutlineInputBorder(
    //   borderSide: BorderSide(color: Colors.red),
    // ),
    fillColor: ColorConstants.grey,
    disabledBorder: InputBorder.none,
    hintText: hint,
    hintStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: ColorConstants.hintColor,
    ),
  );
}
