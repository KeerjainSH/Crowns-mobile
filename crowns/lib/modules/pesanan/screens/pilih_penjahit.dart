import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/catalog/models/catalog.dart';
import 'package:crowns/modules/catalog/screens/kreasi.dart';
import 'package:crowns/modules/pesanan/models/penjahit.dart';
import 'package:crowns/modules/pesanan/providers/penjahit_provider.dart';
import 'package:crowns/modules/pesanan/screens/update_detail_pesanan.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:crowns/constants/app_constants.dart';
import 'package:crowns/widgets/app_widgets.dart';
import 'package:provider/provider.dart';

class PilihPenjahitScreen extends StatefulWidget {
  final Catalog catalog;
  final int categoryId;

  PilihPenjahitScreen({
    required this.catalog,
    required this.categoryId,
  });

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
      child: penjahitProvider.penjahitList.length > 0
          ? ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: penjahitProvider.penjahitList.length,
              itemBuilder: (context, i) =>
                  tile(penjahitProvider.penjahitList[i]),
            )
          : Text('Belum ada penjahit tersedia untuk baju ini'),
    );

    return WillPopScope(
      onWillPop: () async {
        if (widget.categoryId == -1) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteConstants.catalog,
            (route) => false,
          );
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => KreasiScreen(
                idCategory: widget.categoryId,
              ),
            ),
            (route) => false,
          );
        }
        return true;
      },
      child: Provider(
        lazy: false,
        create: (context) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            penjahitProvider.fetchPenjahitByCatalogId(widget.catalog.id);
          });
        },
        dispose: (context, data) => penjahitProvider.reset(),
        child: SafeArea(
          child: Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height -
                  padding.top -
                  padding.bottom,
              child: penjahitProvider.penjahitStatus == RequestStatus.Fetching
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Column(
                        children: [
                          appHeader,
                          SizedBox(height: 36),
                          Container(
                            width: 221,
                            child: Image.asset(ImageConstants.progressBar2),
                          ),
                          SizedBox(height: 36),
                          Padding(
                            padding: const EdgeInsets.only(left: appPadding),
                            child: buildHeadline(context, 'Penjahit'),
                          ),
                          SizedBox(height: 6),
                          Padding(
                            padding: const EdgeInsets.only(left: appPadding),
                            child: buildSubtitle(
                                context, 'Pilih penjahit favoritmu'),
                          ),
                          SizedBox(height: 15),
                          content,
                        ],
                      ),
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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UpdateDetailPesananPage(
                penjahit: penjahit,
                catalog: widget.catalog,
              ),
            ),
          );
        },
        child: ListTile(
          leading: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              // child: Image.asset(ImageConstants.profilePhoto),
              child: Icon(Icons.person_outline),
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
                    penjahit.rating,
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
