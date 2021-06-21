import 'package:flutter/material.dart';

import 'package:crowns/utils/constants.dart';

class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Image.asset(
        ImageConstants.appHeader,
        fit: BoxFit.cover,
      ),
    );
  }
}
