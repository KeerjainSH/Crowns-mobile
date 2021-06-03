import 'package:crowns/utils/image_constants.dart';
import 'package:flutter/material.dart';

import 'package:crowns/widgets/app_header.dart';
import 'package:crowns/widgets/catalog_image.dart';
import 'package:crowns/utils/color_constants.dart';

// import 'package:crowns/utils/image_constants.dart';

class CataloPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 41),
            AppHeader(),
            SizedBox(height: 36),
            Container(
              padding: EdgeInsets.only(left: 32),
              width: 221,
              child: Image.asset(ImageConstants.progressBar2),
            ),
            SizedBox(height: 36),
            Container(
              padding: EdgeInsets.only(left: 32),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Katalog',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            SizedBox(height: 6),
            Container(
              padding: EdgeInsets.only(left: 32),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Busana spesialis para penjahit kamu!',
                  style: TextStyle(
                    color: ColorConstants.darkGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            SizedBox(height: 14),
            Container(
              padding: EdgeInsets.only(left: 32),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Seragam Sekolah',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 106,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 32),
                  CatalogImage(),
                  CatalogImage(),
                  CatalogImage(),
                  CatalogImage(),
                  CatalogImage(),
                  CatalogImage(),
                  CatalogImage(),
                ],
              ),
            ),
            SizedBox(height: 14),
            Container(
              padding: EdgeInsets.only(left: 32),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Busana Pesta',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 106,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 32),
                  CatalogImage(),
                  CatalogImage(),
                  CatalogImage(),
                  CatalogImage(),
                  CatalogImage(),
                  CatalogImage(),
                  CatalogImage(),
                ],
              ),
            ),
            SizedBox(height: 14),
            Container(
              padding: EdgeInsets.only(left: 32),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Busana Formal',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 106,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 32),
                  CatalogImage(),
                  CatalogImage(),
                  CatalogImage(),
                  CatalogImage(),
                  CatalogImage(),
                  CatalogImage(),
                  CatalogImage(),
                ],
              ),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
