import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:crowns/constants/app_constants.dart';
import 'package:crowns/modules/pesanan/providers/pesanan_provider.dart';
import 'package:crowns/widgets/app_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PesananScreen extends StatefulWidget {
  const PesananScreen({Key? key}) : super(key: key);

  @override
  _PesananScreenState createState() => _PesananScreenState();
}

class _PesananScreenState extends State<PesananScreen> {
  String _currState = 'Semua';

  @override
  Widget build(BuildContext context) {
    PesananProvider pesananProvider =
        Provider.of<PesananProvider>(context, listen: false);

    var padding = MediaQuery.of(context).padding;

    final appBar = AppBar(
      title: Text(
        'Pesanan',
        style: TextStyle(color: Colors.black),
      ),
      leading: SizedBox.shrink(),
      backgroundColor: Colors.white,
    );

    Align buildTileContent() {
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: ColorConstants.grey,
                offset: Offset(0, 2),
                blurRadius: 1,
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          height: 120,
          child: Row(
            children: [
              Container(
                height: 200,
                child: Image.asset(ImageConstants.appLogo),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Seragam SMP',
                      ),
                    ),
                    SizedBox(height: 2),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Perempuan - Lengan dan Rok Panjang',
                        style: TextStyle(
                          color: ColorConstants.darkGrey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorConstants.softBlue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 3,
                        ),
                        child: Text(
                          'Dikerjakan',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    final content = Container(
      child: Column(
        children: [
          buildTileContent(),
        ],
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        backgroundColor: Colors.white,
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                backgroundColor: ColorConstants.primaryColor,
                unselectedBackgroundColor: ColorConstants.grey,
                unselectedLabelStyle: TextStyle(color: Colors.black),
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                tabs: [
                  Tab(text: "Pesanan Baru"),
                  Tab(text: "Dikerjakan"),
                  Tab(text: "Selesai"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    FutureBuilder(
                      future: pesananProvider.fetchAllPesananBelumValid(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return snapshot.connectionState == ConnectionState.done
                            ? buildTileContent()
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                    Center(
                      child: Icon(Icons.directions_transit),
                    ),
                    Center(
                      child: Icon(Icons.directions_bike),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        extendBody: true,
        bottomNavigationBar: navbar,
      ),
    );
  }
}
