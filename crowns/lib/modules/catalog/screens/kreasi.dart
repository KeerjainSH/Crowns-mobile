import 'package:crowns/modules/catalog/models/catalog.dart';
import 'package:crowns/modules/catalog/providers/catalog_provider.dart';
import 'package:flutter/material.dart';

import 'package:crowns/widgets/app_widgets.dart';
import 'package:crowns/constants/app_constants.dart';
import 'package:provider/provider.dart';

class KreasiScreen extends StatefulWidget {
  const KreasiScreen({Key? key}) : super(key: key);

  @override
  _KreasiScreenState createState() => _KreasiScreenState();
}

class _KreasiScreenState extends State<KreasiScreen> {
  @override
  Widget build(BuildContext context) {
    CatalogProvider catalogProvider =
        Provider.of<CatalogProvider>(context, listen: false);

    final padding = MediaQuery.of(context).padding;

    InkWell _buildCatalogImage(Catalog catalog) {
      return InkWell(
        onTap: () {
          Navigator.pushNamed(context, RouteConstants.pilihPenjahit);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
              image: MemoryImage(catalog.foto),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    Consumer _buildCatalog(String text) {
      return Consumer<CatalogProvider>(
        builder: (context, model, child) {
          return GridView.count(
            mainAxisSpacing: 8,
            crossAxisSpacing: 10,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            childAspectRatio: 4 / 5,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: appPadding),
            children: List.generate(
              model.catalogByCategoryList.length,
              (index) => _buildCatalogImage(model.catalogByCategoryList[index]),
            ),
          );
        },
      );
    }

    return Provider(
      create: (context) => catalogProvider.fetchCatalogByCategoryId(1),
      dispose: (context, data) => catalogProvider.resetKreasi(),
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
                  appHeader,
                  SizedBox(height: 36),

                  /// Show image progress bar
                  Container(
                    width: 221,
                    child: Image.asset(ImageConstants.progressBar2),
                  ),
                  SizedBox(height: 36),
                  Container(
                    padding: EdgeInsets.only(left: appPadding),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Katalog Kategori',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(left: appPadding),
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
                  SizedBox(height: 15),
                  _buildCatalog('Seragam Sekolah'),
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
