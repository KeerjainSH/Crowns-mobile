import 'package:crowns/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:crowns/widgets/texts.dart';

import 'package:crowns/utils/constants.dart';

import 'package:crowns/widgets/custom_button.dart';

class PembayaranPage extends StatefulWidget {
  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  File? _image;
  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromGallery() async {
    print('getImage');
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Padding buildInfoPembayaran() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: ColorConstants.grey,
              offset: Offset(0, 5),
              spreadRadius: 2,
            ),
          ],
        ),
        padding: EdgeInsets.all(12),

        /// Please comment this
        child: Column(
          children: [
            Headline('Pembayaran'),
            SizedBox(height: 6),
            Subtitle('Estimasi harga yang harus dibayar'),
            SizedBox(height: 20),

            // Detil Pembayaran Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Biaya Jahit',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      SizedBox(height: 6),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Biaya Bahan dan Material',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      SizedBox(height: 6),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Biaya Kirim',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Rp 120.000',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      SizedBox(height: 6),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Rp 300.000',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      SizedBox(height: 6),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Rp 20.000',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Container(
              color: ColorConstants.middleGrey,
              height: 1,
              width: double.infinity,
            ),

            /// Detil Pembayaran Total
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Biaya',
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  'Rp 440.000',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            SizedBox(height: 28),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nomor Rekening Bank BRI',
                style: TextStyle(
                  color: ColorConstants.darkGrey,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '08108215339377748',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: ColorConstants.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildButtonUpload() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 40,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontFamily: 'SFProDisplay'),
            primary: ColorConstants.softBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(180.0),
            ),
          ),
          onPressed: getImageFromGallery,
          child: Text(
            'Unggah Bukti Pembayaran',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 41),
            appHeader,
            SizedBox(height: 34),
            buildInfoPembayaran(),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 200,
              child: _image == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_outlined,
                          size: 40,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Format gambar: JPG, JPEG, PNG, max. 5 MB',
                          style: TextStyle(color: ColorConstants.darkGrey),
                        ),
                        SizedBox(height: 5),
                        buildButtonUpload(),
                      ],
                    )
                  : Stack(
                      children: [
                        Center(
                          child: Image.file(
                            _image!,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: getImageFromGallery,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(Icons.mode_edit),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            SizedBox(height: 34),
            CustomButton(
              text: 'simpan',
              route: RouteConstants.menungguKonfirmasi,
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
