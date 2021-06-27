import 'dart:io';

import 'package:crowns/models/desain_custom.dart';
import 'package:crowns/models/detail_pesanan.dart';
import 'package:crowns/provider/auth/auth_provider.dart';
import 'package:crowns/provider/pesanan/detail_pesanan_provider.dart';
import 'package:crowns/screens/pesanan/upload_desain.dart';
import 'package:crowns/widgets/custom_button.dart';
import 'package:crowns/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:crowns/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class DetailPesananPage extends StatefulWidget {
  @override
  _DetailPesananPageState createState() => _DetailPesananPageState();
}

class _DetailPesananPageState extends State<DetailPesananPage> {
  List<DesainCustom> _imageList = [];
  int _highlightedImageIndex = 0;

  int _count = 1;

  DetailPesananStatus _state = DetailPesananStatus.NotChoosen;

  @override
  Widget build(BuildContext context) {
    DetailPesananProvider detailPesananProvider =
        Provider.of<DetailPesananProvider>(context);

    final productPicture = Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.0),
        child: detailPesananProvider.detailPesananStatus ==
                DetailPesananStatus.DesainAdded
            ? Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.file(
                  detailPesananProvider
                      .desainCustomList[_highlightedImageIndex].image,
                  fit: BoxFit.fitHeight,
                ),
              )
            : Image.asset(
                ImageConstants.seragamProduc1,
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
          detailPesananProvider.detailPesananStatus ==
                  DetailPesananStatus.DesainAdded
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    detailPesananProvider
                        .desainCustomList[_highlightedImageIndex].description,
                    style: TextStyle(
                      color: ColorConstants.darkGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              : Align(
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
        Text(
          'Jumlah',
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  if (_count > 1) _count--;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: ColorConstants.primaryColor,
                    borderRadius: BorderRadius.circular(5.0)),
                height: 18,
                width: 18,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '-',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 3),
            Container(
              height: 18,
              width: 43,
              color: ColorConstants.middleGrey,
              child: Center(
                child: Text(
                  "$_count",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(width: 3),
            InkWell(
              onTap: () {
                setState(() {
                  _count++;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: ColorConstants.primaryColor,
                    borderRadius: BorderRadius.circular(5.0)),
                height: 18,
                width: 18,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '+',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );

    final header = Container(
      decoration: BoxDecoration(
        color: ColorConstants.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: ColorConstants.grey,
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
      padding: EdgeInsets.only(left: 23, right: 23),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Detail Pesanan',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 6),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Isi sesuai dengan pesanan kamu ya!',
              style: TextStyle(
                fontSize: 13,
                color: ColorConstants.darkGrey,
              ),
            ),
          ),
          SizedBox(height: 15),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _count,
              itemBuilder: (context, i) {
                return FormDetilPesanan(counter: i);
              },
            ),
          ),
        ],
      ),
    );

    final submitButton = Container(
      padding: EdgeInsets.symmetric(horizontal: 23),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: 125,
          height: 40,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontFamily: 'SFProDisplay'),
            primary: ColorConstants.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(180.0),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, RouteConstants.isiAlamat);
          },
          child: Text(
            'pesan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );

    final question = Container(
      decoration: BoxDecoration(
        color: ColorConstants.softBlue,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.symmetric(horizontal: 23),
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 7,
            child: Text(
              'Apakah kamu ingin memakai desain sendiri?',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      detailPesananProvider
                          .setStatus(DetailPesananStatus.DesainSendiri);
                    },
                    child: Text('Ya'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontFamily: 'SFProDisplay'),
                      primary: ColorConstants.primaryColor,
                      visualDensity: VisualDensity.compact,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _state = DetailPesananStatus.DesainPenjahit;
                      });
                    },
                    child: Text('Tidak'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontFamily: 'SFProDisplay'),
                      primary: ColorConstants.darkGrey,
                      visualDensity: VisualDensity.compact,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    Container _buildCatalogImage(File imageItem, int index) {
      return Container(
        margin: EdgeInsets.only(right: 15),
        width: 83,
        child: InkWell(
          onTap: () {
            setState(() {
              print('highlight');
              _highlightedImageIndex = index;
            });
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.file(
              detailPesananProvider.desainCustomList[index].image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    final showDesainDialog = () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return UploadDesainDialog();
        },
      );
    };

    final uploadDesain = Container(
      decoration: BoxDecoration(
        color: ColorConstants.softBlue,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.symmetric(horizontal: 23),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              'Upload desain kamu di sini!',
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  onPressed: showDesainDialog,
                  child: Text('Pilih Gambar'),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontFamily: 'SFProDisplay'),
                    primary: ColorConstants.primaryColor,
                    visualDensity: VisualDensity.comfortable,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    final catalogAddImage = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: ColorConstants.grey,
      ),
      margin: EdgeInsets.only(right: 15),
      width: 83,
      child: InkWell(
        // onTap: getImageFromGallery,
        onTap: showDesainDialog,
        child: Center(
          child: Icon(Icons.add),
        ),
      ),
    );

    final uploadedImages = Column(
      children: [
        SizedBox(height: 14),
        Container(
          padding: EdgeInsets.only(left: 23),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Desain Kamu',
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
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [Container(child: SizedBox(width: 23))] +
                List.generate(
                  detailPesananProvider.desainCustomList.length,
                  (index) => _buildCatalogImage(
                    detailPesananProvider.desainCustomList[index].image,
                    index,
                  ),
                ) +
                [Container(child: catalogAddImage)],
          ),
        ),
      ],
    );

    return Provider(
      lazy: false,
      create: (context) {},
      dispose: (context, data) => detailPesananProvider.resetDetailPesanan(),
      child: Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              header,
              SizedBox(height: 15),
              detailPesananProvider.detailPesananStatus ==
                      DetailPesananStatus.NotChoosen
                  ? question
                  : SizedBox.shrink(),
              detailPesananProvider.detailPesananStatus ==
                      DetailPesananStatus.DesainSendiri
                  ? uploadDesain
                  : SizedBox.shrink(),
              detailPesananProvider.detailPesananStatus ==
                      DetailPesananStatus.DesainAdded
                  ? uploadedImages
                  : SizedBox.shrink(),
              SizedBox(height: 15),
              form,
              SizedBox(height: 25),
              submitButton,
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class FormDetilPesanan extends StatelessWidget {
  int counter;

  FormDetilPesanan({required this.counter});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        counter > 0
            ? Container(
                height: 1,
                color: ColorConstants.middleGrey,
              )
            : Container(),
        SizedBox(height: 11),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Nama Lengkap',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          height: 25,
          padding: EdgeInsets.only(left: 11),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Ukuran Baju',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 1),
        Container(
          padding: EdgeInsets.only(
            left: 5,
            right: 5,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UkuranBajuFormField(label: 'Lengan'),
                  UkuranBajuFormField(label: 'Pinggang'),
                  UkuranBajuFormField(label: 'Dada'),
                ],
              ),
              SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UkuranBajuFormField(label: 'Leher'),
                  UkuranBajuFormField(label: 'Tinggi Tubuh'),
                  UkuranBajuFormField(label: 'Berat Badan'),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Instruksi Pembuatan',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          padding: EdgeInsets.only(left: 11),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              keyboardType: TextInputType.multiline,
              minLines: 4,
              maxLines: null,
            ),
          ),
        ),
        SizedBox(height: 22),
      ],
    );
  }
}

class UkuranBajuFormField extends StatelessWidget {
  final String label;

  UkuranBajuFormField({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              this.label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: ColorConstants.darkGrey,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: ColorConstants.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 25,
            padding: EdgeInsets.only(left: 11),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
