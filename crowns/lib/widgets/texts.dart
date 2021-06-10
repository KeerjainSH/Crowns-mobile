import 'package:flutter/material.dart';

import 'package:crowns/utils/color_constants.dart';

class Headline extends StatelessWidget {
  final String text;

  Headline(this.text);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
      ),
    );
  }
}

class Subtitle extends StatelessWidget {
  final String text;

  Subtitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(color: ColorConstants.darkGrey),
      ),
    );
  }
}
