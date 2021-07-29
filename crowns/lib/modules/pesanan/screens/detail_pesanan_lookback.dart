import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/pesanan/components/form_detail_pesanan.dart';
import 'package:crowns/modules/pesanan/components/form_detail_pesanan_filled.dart';
import 'package:crowns/modules/pesanan/models/detail_pesanan.dart';
import 'package:crowns/modules/pesanan/models/pesanan.dart';
import 'package:crowns/modules/pesanan/providers/penjahit_provider.dart';
import 'package:crowns/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'dart:io';

import 'package:crowns/modules/pesanan/providers/pesanan_provider.dart';
import 'package:crowns/modules/pesanan/components/upload_desain_dialog.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:crowns/constants/app_constants.dart';
import 'package:provider/provider.dart';

class DetailPesananLookbackPage extends StatefulWidget {
  Pesanan pesanan;

  DetailPesananLookbackPage({required this.pesanan});

  @override
  _DetailPesananLookbackPageState createState() =>
      _DetailPesananLookbackPageState();
}

class _DetailPesananLookbackPageState extends State<DetailPesananLookbackPage> {
  int _highlightedImageIndex = 0;
  bool _kainSendiri = false;
  bool _desainSendiri = false;

  @override
  Widget build(BuildContext context) {
    PenjahitProvider penjahitProvider = Provider.of<PenjahitProvider>(context);

    final productPicture = Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.0),
        child: widget.pesanan.designKustom.length > 0
            ? Image.network(
                widget.pesanan.designKustom[_highlightedImageIndex].foto)
            : Image.network(
                widget.pesanan.baju.foto,
              ),
      ),
    );

    final productInfo = Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Seragam SMP',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Perempuan',
              style: TextStyle(
                color: ColorConstants.darkGrey,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Lengan dan Rok Panjang',
              style: TextStyle(
                color: ColorConstants.darkGrey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );

    final orderQuantity = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildFormLabel2(context, 'Jumlah'),
        Container(
          height: 18,
          width: 43,
          color: ColorConstants.grey,
          child: Center(
            child: Text(
              widget.pesanan.detail_pesanan.length.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );

    final header = Container(
      decoration: BoxDecoration(
        color: ColorConstants.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: ColorConstants.softGrey,
            blurRadius: 6,
            offset: Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
      ),
      padding: EdgeInsets.only(
        top: 58,
        bottom: 23,
        left: 23,
        right: 40,
      ),
      height: 213,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          productPicture,
          SizedBox(width: 17),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                productInfo,
                orderQuantity,
              ],
            ),
          )
        ],
      ),
    );

    final form = Container(
      padding: EdgeInsets.symmetric(horizontal: appPadding),
      child: Column(
        children: [
          buildHeadline(context, 'Detail Pesanan'),
          SizedBox(height: 10),
          Form(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.pesanan.detail_pesanan.length,
                itemBuilder: (context, i) {
                  return FormDetailPesananFilled(
                      detailPesanan: widget.pesanan.detail_pesanan[i]);
                },
              ),
            ),
          ),
        ],
      ),
    );

    void showDesainDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return UploadDesainDialog();
        },
      );
    }

    final catalogAddImage = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: ColorConstants.softGrey,
      ),
      margin: EdgeInsets.only(right: 15),
      width: 83,
      child: InkWell(
        onTap: showDesainDialog,
        child: Center(
          child: Icon(Icons.add),
        ),
      ),
    );

    Container _buildCatalogImage(String foto, int index) {
      return Container(
        margin: EdgeInsets.only(right: 15),
        width: 83,
        child: InkWell(
          onTap: () {
            setState(() {
              _highlightedImageIndex = index;
            });
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              foto,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    final uploadedImages = Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 23),
          child: Align(
            alignment: Alignment.centerLeft,
            child: buildHeadline2(context, 'Desain Kamu'),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 106,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [Container(child: SizedBox(width: 23))] +
                List.generate(
                  widget.pesanan.designKustom.length,
                  (index) => _buildCatalogImage(
                    widget.pesanan.designKustom[index].foto,
                    index,
                  ),
                ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );

    var alamat = Column(
      children: [
        buildHeadline(context, 'Lokasi Penjahit'),
        buildSubtitle(context, 'Ambil baju disini ya!'),
        SizedBox(height: 15),
        buildHeadline2(context, penjahitProvider.alamatPenjahit.nama),
        SizedBox(height: 10),
        buildFormLabel(context, 'Kecamatan'),
        SizedBox(height: 5),
        buildBodyText3(context, penjahitProvider.alamatPenjahit.kecamatan),
        SizedBox(height: 10),
        buildFormLabel(context, 'Kota'),
        SizedBox(height: 5),
        buildBodyText3(context, penjahitProvider.alamatPenjahit.kota),
        SizedBox(height: 10),
        buildFormLabel(context, 'No Telepon'),
        SizedBox(height: 5),
        buildBodyText3(context, penjahitProvider.alamatPenjahit.no_hp),
      ],
    );

    return Provider(
      lazy: false,
      create: (context) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          penjahitProvider.fetchAlamatPenjahit(widget.pesanan.id_penjahit);
        });
      },
      dispose: (context, data) => penjahitProvider.reset(),
      child: Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
        body: penjahitProvider.alamatPenjahitStatus == RequestStatus.Fetching
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: [
                    header,
                    SizedBox(height: 15),
                    widget.pesanan.designKustom.length > 1
                        ? uploadedImages
                        : SizedBox.shrink(),
                    SizedBox(height: 15),
                    form,
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: alamat,
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
      ),
    );
  }
}
