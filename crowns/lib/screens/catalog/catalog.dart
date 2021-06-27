import 'package:flutter/material.dart';

import 'package:crowns/widgets/floating_bottom_navigation_bar.dart';
import 'package:crowns/widgets/widgets.dart';
import 'package:crowns/utils/constants.dart';

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    Container _buildCatalogImage() {
      return Container(
        margin: EdgeInsets.only(right: 15),
        width: 83,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouteConstants.pilihPenjahit);
            },
            child: Image.asset(ImageConstants.pestaProduct1),
          ),
        ),
      );
    }

    Column _buildCatalogPerCategory(String text) {
      return Column(
        children: [
          SizedBox(height: 14),
          Container(
            padding: EdgeInsets.only(left: 32),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
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
                _buildCatalogImage(),
                _buildCatalogImage(),
                _buildCatalogImage(),
                _buildCatalogImage(),
                _buildCatalogImage(),
                _buildCatalogImage(),
                _buildCatalogImage(),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 41),
            appHeader,
            SizedBox(height: 36),

            /// Show image progress bar
            Container(
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
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
              ),
            ),

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
            _buildCatalogPerCategory('Seragam Sekolah'),
            _buildCatalogPerCategory('Busana Pesta'),
            _buildCatalogPerCategory('Busana Formal'),
            SizedBox(height: 32),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: navbar,
    );
  }
}
