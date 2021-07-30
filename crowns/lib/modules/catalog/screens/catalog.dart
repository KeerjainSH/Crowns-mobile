import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/catalog/models/catalog.dart';
import 'package:crowns/modules/catalog/providers/catalog_provider.dart';
import 'package:crowns/modules/pesanan/screens/pilih_penjahit.dart';
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
    CatalogProvider catalogProvider = Provider.of<CatalogProvider>(context);

    final padding = MediaQuery.of(context).padding;

    Container _buildCatalogImage(Catalog catalog, int index) {
      return Container(
        margin: index == 0
            ? EdgeInsets.only(left: appPadding, right: 15)
            : EdgeInsets.only(right: 15),
        width: 83,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PilihPenjahitScreen(catalog: catalog),
                  ));
            },
            child: FadeInImage(
              image: NetworkImage(catalog.foto),
              placeholder: AssetImage(ImageConstants.appLogo),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    Column _buildCatalogPerCategory() {
      return Column(
        children: catalogProvider.catalogAllByCategory.entries.map((entry) {
          return Column(
            children: [
              SizedBox(height: 14),
              Container(
                padding: EdgeInsets.only(left: appPadding),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    entry.key,
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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: entry.value.length,
                  itemBuilder: (context, i) {
                    return _buildCatalogImage(entry.value[i], i);
                  },
                ),
              ),
            ],
          );
        }).toList(),
      );
    }

    return Provider(
      create: (context) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          catalogProvider.fetchCatalogAll();
        });
      },
      dispose: (context, data) => catalogProvider.resetCatalog(),
      lazy: false,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height -
                padding.top -
                padding.bottom,
            child: catalogProvider.catalogAllStatus == RequestStatus.Fetching
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        appHeader,
                        SizedBox(height: 36),

                        /// Show image progress bar
                        Container(
                          width: 221,
                          child: Image.asset(ImageConstants.progressBar1),
                        ),
                        SizedBox(height: 36),
                        Container(
                          padding: EdgeInsets.only(left: appPadding),
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
                        _buildCatalogPerCategory(),
                        SizedBox(height: 80),
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
