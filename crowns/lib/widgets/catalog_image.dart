import 'package:flutter/material.dart';

import 'package:crowns/utils/image_constants.dart';

class CatalogImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: 83,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.asset(ImageConstants.pestaProduct1),
      ),
    );
  }
}
