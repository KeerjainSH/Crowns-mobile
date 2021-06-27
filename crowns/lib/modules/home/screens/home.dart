import 'package:crowns/modules/home/models/category.dart';
import 'package:crowns/modules/home/providers/home_provider.dart';
import 'package:crowns/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:crowns/widgets/floating_bottom_navigation_bar.dart';
import 'package:crowns/constants/app_constants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);

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
          onTap: () => Navigator.pushNamed(context, RouteConstants.kreasi),
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
                        'Batik',
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
          Consumer<HomeProvider>(builder: (context, model, child) {
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
      create: (context) => homeProvider.fetchCategory(),
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
