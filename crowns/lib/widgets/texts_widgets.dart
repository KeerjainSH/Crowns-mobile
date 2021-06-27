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

Container buildHeadline(BuildContext context, String text) {
  return Container(
    margin: EdgeInsets.only(left: appPadding),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    ),
  );
}

Container buildSubtitle(BuildContext context, String text) {
  return Container(
    padding: EdgeInsets.only(left: appPadding),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    ),
  );
}

Align buildHeadline5(BuildContext context, String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: Theme.of(context).textTheme.headline5,
    ),
  );
}
