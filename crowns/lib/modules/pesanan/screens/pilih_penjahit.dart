import 'package:crowns/widgets/texts_widgets.dart';
import 'package:flutter/material.dart';

import 'package:crowns/constants/app_constants.dart';
import 'package:crowns/widgets/app_widgets.dart';

class PilihPenjahitScreen extends StatefulWidget {
  @override
  _PilihPenjahitScreenState createState() => _PilihPenjahitScreenState();
}

class _PilihPenjahitScreenState extends State<PilihPenjahitScreen> {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    final content = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, i) => tile(),
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: Container(
          height:
              MediaQuery.of(context).size.height - padding.top - padding.bottom,
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                appHeader,
                SizedBox(height: 36),
                Container(
                  width: 221,
                  child: Image.asset(ImageConstants.progressBar1),
                ),
                SizedBox(height: 36),
                buildHeadline(context, 'Penjahit'),
                SizedBox(height: 6),
                buildSubtitle(context, 'Pilih penjahit favoritmu'),
                SizedBox(height: 15),
                content,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding tile() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RouteConstants.detilPesanan);
        },
        child: ListTile(
          leading: Container(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    color: ColorConstants.grey,
                    offset: Offset(-2, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(ImageConstants.profilePhoto),
              ),
            ),
          ),
          title: Text(
            'Pak Munir',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            'Jl. Pagesangan No. 5',
            style: TextStyle(
              fontSize: 10,
              color: ColorConstants.darkGrey,
            ),
          ),
        ),
      ),
    );
  }
}
