import 'package:crowns/modules/pesanan/models/penjahit.dart';
import 'package:crowns/modules/pesanan/providers/penjahit_provider.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:crowns/constants/app_constants.dart';
import 'package:crowns/widgets/app_widgets.dart';
import 'package:provider/provider.dart';

class PilihPenjahitScreen extends StatefulWidget {
  @override
  _PilihPenjahitScreenState createState() => _PilihPenjahitScreenState();
}

class _PilihPenjahitScreenState extends State<PilihPenjahitScreen> {
  @override
  Widget build(BuildContext context) {
    PenjahitProvider penjahitProvider = Provider.of<PenjahitProvider>(context);

    final padding = MediaQuery.of(context).padding;

    final content = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: penjahitProvider.penjahitList.length,
        itemBuilder: (context, i) => tile(penjahitProvider.penjahitList[i]),
      ),
    );

    return Provider(
      lazy: false,
      create: (context) => penjahitProvider.fetchPenjahitByCatalogId(2),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height -
                padding.top -
                padding.bottom,
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
                  Padding(
                    padding: const EdgeInsets.only(left: appPadding),
                    child: buildHeadline(context, 'Penjahit'),
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.only(left: appPadding),
                    child: buildSubtitle(context, 'Pilih penjahit favoritmu'),
                  ),
                  SizedBox(height: 15),
                  content,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding tile(Penjahit penjahit) {
    return Padding(
      padding: EdgeInsets.only(
        left: appPadding,
        right: appPadding + 10,
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, RouteConstants.detilPesanan),
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
            penjahit.nama,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            penjahit.alamat,
            style: TextStyle(
              fontSize: 10,
              color: ColorConstants.darkGrey,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          visualDensity: VisualDensity.comfortable,
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '4.8',
                    style: TextStyle(
                      color: ColorConstants.darkGrey,
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(width: 5),
                  SvgPicture.asset(ImageConstants.starIcon),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
