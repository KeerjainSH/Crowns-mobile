import 'package:crowns/constants/app_constants.dart';
import 'package:flutter/material.dart';

Align buildBodyText2(BuildContext context, String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: Theme.of(context).textTheme.bodyText2,
    ),
  );
}

Align buildBodyText3(BuildContext context, String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 12,
        color: ColorConstants.darkGrey,
      ),
    ),
  );
}

Align buildHeadline(BuildContext context, String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: Theme.of(context).textTheme.headline6,
    ),
  );
}

Align buildHeadline2(BuildContext context, String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Align buildSubtitle(BuildContext context, String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: Theme.of(context).textTheme.subtitle2,
    ),
  );
}

Align buildFormLabel(BuildContext context, String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: Theme.of(context).textTheme.bodyText1,
    ),
  );
}

Align buildFormLabel2(BuildContext context, String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Align buildFormLabel3(BuildContext contxt, String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 13,
        color: ColorConstants.darkGrey,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Align buildDialogTextLabel(BuildContext context, String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Text buildButtonText(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  );
}

Text buildLightButtonText(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(
      color: ColorConstants.primaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  );
}

Text buildButtonText2(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  );
}
