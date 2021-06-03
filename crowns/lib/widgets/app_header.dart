import 'package:flutter/material.dart';

import 'package:crowns/utils/image_constants.dart';

class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 32),
      width: double.infinity,
      child: Image.asset(
        ImageConstants.appHeader,
        fit: BoxFit.cover,
      ),
    );
  }
}
