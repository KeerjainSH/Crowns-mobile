import 'package:crowns/modules/catalog/models/catalog.dart';
import 'package:crowns/modules/catalog/providers/catalog_provider.dart';
import 'package:flutter/material.dart';

import 'package:crowns/widgets/app_widgets.dart';
import 'package:crowns/constants/app_constants.dart';
import 'package:provider/provider.dart';

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    CatalogProvider catalogProvider =
        Provider.of<CatalogProvider>(context, listen: false);

    final padding = MediaQuery.of(context).padding;

    Container _buildCatalogImage(Catalog catalog, int index) {
      return Container(
        margin: index == 0
            ? EdgeInsets.only(left: 32, right: 15)
            : EdgeInsets.only(right: 15),
        width: 83,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouteConstants.pilihPenjahit);
            },
            child: new Image.memory(catalog.foto),
            // child: Text(catalog.nama),
            // child: Image.asset(ImageConstants.pestaProduct1),
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
          Consumer<CatalogProvider>(
            builder: (context, model, child) {
              return Container(
                height: 106,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: model.catalogAllList.length,
                  itemBuilder: (context, i) {
                    return _buildCatalogImage(model.catalogAllList[i], i);
                  },
                ),
              );
            },
          ),
        ],
      );
    }

    return Provider(
      create: (context) => catalogProvider.fetchCatalogAll(),
      lazy: false,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height -
                padding.top -
                padding.bottom,
            child: SingleChildScrollView(
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
          ),
          extendBody: true,
          bottomNavigationBar: navbar,
        ),
      ),
    );
  }
}
