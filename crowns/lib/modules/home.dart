import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/catalog/models/category.dart';
import 'package:crowns/modules/catalog/providers/catalog_provider.dart';
import 'package:crowns/modules/catalog/screens/kreasi.dart';
import 'package:crowns/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:crowns/constants/app_constants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    CatalogProvider catalogProvider = Provider.of<CatalogProvider>(context);

    var padding = MediaQuery.of(context).padding;

    final jahitSekarang = Container(
      padding: EdgeInsets.only(left: 29, right: 29),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Create our Own Style',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 2),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Mau berkreasi apa hari ini?',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 8),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouteConstants.catalog);
            },
            child: Image.asset(
              ImageConstants.jahitSeakarangBanner,
            ),
          ),
        ],
      ),
    );

    Align buildKreasiItem(Category category, int index) {
      return Align(
        alignment: Alignment.topCenter,
        child: InkWell(
          onTap: () {
            catalogProvider.categoryId = category.id;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => KreasiScreen(
                  idCategory: category.id,
                ),
              ),
            );
          },
          child: Container(
            margin: index == 0
                ? EdgeInsets.symmetric(horizontal: 29)
                : EdgeInsets.only(right: 29),
            height: 120,
            width: 120,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    offset: Offset(-5, 3),
                    blurRadius: 2,
                  )
                ],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image.asset(
                      ImageConstants.kreasiDisplay1,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        category.nama,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    final kreasi = Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 29, right: 29),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Kreasi',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(height: 2),
          Container(
            padding: EdgeInsets.only(left: 29, right: 29),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Apa yang kamu butuhkan saat ini?',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Consumer<CatalogProvider>(builder: (context, model, child) {
            return Container(
              height: 125,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: model.categoryList.length,
                itemBuilder: (context, i) {
                  return buildKreasiItem(model.categoryList[i], i);
                },
              ),
            );
          }),
        ],
      ),
    );

    return Provider(
      create: (context) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          catalogProvider.fetchCategory();
          setState(() {});
        });
      },
      lazy: false,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height -
                padding.top -
                padding.bottom,
            child: catalogProvider.categoryStatus == RequestStatus.Fetching
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        /// Header home page
                        Container(
                          width: double.infinity,
                          child: Image.asset(
                            ImageConstants.homeHeader,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 55),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            jahitSekarang,
                            SizedBox(height: 42),
                            kreasi,
                            SizedBox(height: 100)
                          ],
                        ),
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
