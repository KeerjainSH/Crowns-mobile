import 'package:crowns/modules/pesanan/components/form_detail_pesanan.dart';
import 'package:crowns/modules/pesanan/components/form_detail_pesanan_filled.dart';
import 'package:crowns/modules/pesanan/models/detail_pesanan.dart';
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
  List<DetailPesanan> detailPesanan;

  DetailPesananLookbackPage({required this.detailPesanan});

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
    final productPicture = Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.0),
        child: Image.asset(
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
              widget.detailPesanan.length.toString(),
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
                itemCount: widget.detailPesanan.length,
                itemBuilder: (context, i) {
                  return FormDetailPesananFilled(
                      detailPesanan: widget.detailPesanan[i]);
                },
              ),
            ),
          ),
        ],
      ),
    );

    // Container _buildCatalogImage(File imageItem, int index) {
    //   return Container(
    //     margin: EdgeInsets.only(right: 15),
    //     width: 83,
    //     child: InkWell(
    //       onTap: () {
    //         setState(() {
    //           _highlightedImageIndex = index;
    //         });
    //       },
    //       child: ClipRRect(
    //         borderRadius: BorderRadius.circular(18),
    //         child: Image.file(
    //           pesananProvider.desainCustomList[index].foto,
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //     ),
    //   );
    // }

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

    // final uploadedImages = Column(
    //   children: [
    //     Container(
    //       padding: EdgeInsets.only(left: 23),
    //       child: Align(
    //         alignment: Alignment.centerLeft,
    //         child: buildHeadline2(context, 'Desain Kamu'),
    //       ),
    //     ),
    //     SizedBox(height: 10),
    //     Container(
    //       height: 106,
    //       child: ListView(
    //         scrollDirection: Axis.horizontal,
    //         children: [Container(child: SizedBox(width: 23))] +
    //             List.generate(
    //               pesananProvider.desainCustomList.length,
    //               (index) => _buildCatalogImage(
    //                 pesananProvider.desainCustomList[index].foto,
    //                 index,
    //               ),
    //             ) +
    //             [Container(child: catalogAddImage)],
    //       ),
    //     ),
    //     SizedBox(height: 10),
    //   ],
    // );

    final submitButton = CustomButton(
      text: 'pesan',
      callback: () => Navigator.pushNamed(context, RouteConstants.isiAlamat),
      // callback: () => formKey.currentState!.validate(),
      // callback: () {
      //   final FormState? formState = formKey.currentState;
      //
      //   if (formState!.validate()) {
      //     formState.save();
      //
      //     pesananProvider.uploadDesain();
      //     pesananProvider.updateDetailPesanan(
      //         pesananProvider.detailPesananList, pesananProvider.pesanan);
      //   }
      // },
    );

    final questionDesain = Container(
      decoration: BoxDecoration(
        color: ColorConstants.softGrey,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: appPadding,
        vertical: 4,
      ),
      padding: EdgeInsets.all(6),
      child: Row(
        children: [
          Flexible(
            flex: 6,
            child: buildBodyText2(
                context, 'Apakah kamu ingin memakai desain sendiri?'),
          ),
          Flexible(
            flex: 4,
            child: ToggleSwitch(
              minHeight: 30,
              minWidth: MediaQuery.of(context).size.width * 0.15,
              cornerRadius: 20.0,
              activeBgColors: [
                [ColorConstants.primaryColor],
                [ColorConstants.primaryColor],
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              initialLabelIndex: _desainSendiri ? 0 : 1,
              totalSwitches: 2,
              labels: ['Ya', 'Tidak'],
              radiusStyle: true,
              onToggle: (index) {
                setState(() {
                  _desainSendiri = index == 0 ? true : false;
                });
                print('desain sendiri: $_desainSendiri');
              },
            ),
          ),
        ],
      ),
    );

    final questionKain = Container(
      decoration: BoxDecoration(
        color: ColorConstants.softGrey,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: appPadding,
        vertical: 4,
      ),
      padding: EdgeInsets.all(6),
      child: Row(
        children: [
          Flexible(
            flex: 6,
            child: buildBodyText2(
                context, 'Apakah kamu ingin memakai kain sendiri?'),
          ),
          Flexible(
            flex: 4,
            child: ToggleSwitch(
              minHeight: 30,
              minWidth: MediaQuery.of(context).size.width * 0.15,
              cornerRadius: 20.0,
              activeBgColors: [
                [ColorConstants.primaryColor],
                [ColorConstants.primaryColor],
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              initialLabelIndex: _kainSendiri ? 0 : 1,
              totalSwitches: 2,
              labels: ['Ya', 'Tidak'],
              radiusStyle: true,
              onToggle: (index) {
                _kainSendiri = index == 0 ? true : false;
                print('kain sendiri: $_kainSendiri');
              },
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            header,
            SizedBox(height: 15),
            // _desainSendiri ? uploadedImages : SizedBox.shrink(),
            // questionDesain,
            // questionKain,
            SizedBox(height: 15),
            form,
            SizedBox(height: 25),
            submitButton,
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
