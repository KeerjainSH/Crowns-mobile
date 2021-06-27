import 'package:crowns/constants/app_constants.dart';
import 'package:flutter/material.dart';

final inputDecorationBorderTheme = OutlineInputBorder(
  borderRadius: const BorderRadius.all(
    const Radius.circular(16),
  ),
  borderSide: BorderSide(width: 0, style: BorderStyle.none),
);

ThemeData appTheme = ThemeData(
  fontFamily: 'SFProDisplay',
  backgroundColor: Colors.white,
  dialogBackgroundColor: Colors.transparent,
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18),
    ),
  ),
  hintColor: ColorConstants.hintColor,
  inputDecorationTheme: InputDecorationTheme(
      border: inputDecorationBorderTheme,
      focusedBorder: inputDecorationBorderTheme,
      enabledBorder: inputDecorationBorderTheme,
      errorBorder: inputDecorationBorderTheme,
      disabledBorder: inputDecorationBorderTheme,
      filled: true,
      isCollapsed: true,
      fillColor: ColorConstants.softGrey,
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
      )),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: ColorConstants.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(180.0),
      ),
    ),
  ),
  textTheme: TextTheme(
    button: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 22,
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 22,
    ),
    subtitle2: TextStyle(
      color: ColorConstants.darkGrey,
      fontWeight: FontWeight.w400,
      fontSize: 13,
    ),
    bodyText1: TextStyle(
      color: ColorConstants.black,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    bodyText2: TextStyle(
      color: ColorConstants.black,
      fontWeight: FontWeight.w400,
      fontSize: 13,
    ),
  ),
);
