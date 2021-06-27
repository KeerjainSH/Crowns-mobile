import 'package:crowns/utils/constants.dart';
import 'package:crowns/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PesananScreen extends StatefulWidget {
  const PesananScreen({Key? key}) : super(key: key);

  @override
  _PesananScreenState createState() => _PesananScreenState();
}

class _PesananScreenState extends State<PesananScreen> {
  String _currState = 'Semua';

  List<String> _stateList = [
    'Semua',
    'Pesanan Baru',
    'Dikerjakan',
    'Dikirim',
    'Selesai',
  ];

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;

    final appBar = AppBar(
      title: Text(
        'Pesanan',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
    );

    InkWell buildTabBarItem(String text) {
      return InkWell(
        onTap: () {
          setState(() {
            _currState = text;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 3,
          ),
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            color:
                _currState == text ? ColorConstants.primaryColor : Colors.white,
            border: Border.all(
              color: ColorConstants.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: _currState == text ? Colors.white : Colors.black,
              fontSize: 12,
            ),
          ),
        ),
      );
    }

    final tabBar = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        child: Row(
          children: _stateList.map((e) => buildTabBarItem(e)).toList(),
        ),
      ),
    );

    Container buildTileContent() {
      return Container(
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
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                padding.top -
                padding.bottom,
            child: Column(
              children: [
                tabBar,
                content,
              ],
            ),
          ),
        ),
        bottomNavigationBar: navbar,
      ),
    );
  }
}
