import 'package:crowns/constants/metode_bayar.dart';
import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/pembayaran/providers/pembayaran_provider.dart';
import 'package:crowns/modules/pesanan/models/pesanan.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:crowns/widgets/app_widgets.dart';
import 'package:crowns/constants/app_constants.dart';
import 'package:crowns/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class PembayaranPage extends StatefulWidget {
  final Pesanan pesanan;
  final int method;

  PembayaranPage({
    required this.pesanan,
    required this.method,
  });

  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  File? _image;
  final picker = ImagePicker();

  String _state = 'starting';

  Future getImageFromGallery() async {
    print('getImage');
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _state = 'uploaded';
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
              color: ColorConstants.softGrey,
              offset: Offset(0, 5),
              spreadRadius: 2,
            ),
          ],
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            buildHeadline(context, 'Pembayaran'),
            SizedBox(height: 6),
            buildSubtitle(context, 'Estimasi harga yang harus dibayar'),
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
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Biaya Jemput',
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
                          'Rp. ${widget.pesanan.pembayaran.biayaJahit}',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      SizedBox(height: 6),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Rp. ${widget.pesanan.pembayaran.biayaMaterial}',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      SizedBox(height: 6),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Rp. ${widget.pesanan.pembayaran.biayaKirim}',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      SizedBox(height: 6),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Rp. ${widget.pesanan.pembayaran.biayaKirim}',
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
              color: ColorConstants.grey,
              height: 1,
              width: double.infinity,
            ),

            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Biaya',
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  'Rp ${widget.pesanan.biayaTotal}',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Biaya Aplikasi 10%',
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  'Rp ${(int.parse(widget.pesanan.biayaTotal) * 0.1).round().toString()}',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            SizedBox(height: 6),
            Container(
              color: ColorConstants.grey,
              height: 1,
              width: double.infinity,
            ),
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Biaya yang harus dibayar',
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  'Rp ${(int.parse(widget.pesanan.biayaTotal) * 1.1).round().toString()}',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            SizedBox(height: 28),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nomor Rekening ' + metodeBayarList[widget.method].title,
                style: TextStyle(
                  color: ColorConstants.darkGrey,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              metodeBayarList[widget.method].number,
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
            primary: ColorConstants.primaryColor,
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
    return ChangeNotifierProvider<PembayaranProvider>(
      create: (context) => PembayaranProvider(),
      child: Consumer<PembayaranProvider>(
        builder: (context, provider, child) => Scaffold(
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
                _state == 'uploaded'
                    ? provider.uploadBuktiStatus == RequestStatus.Fetching
                        ? Center(child: CircularProgressIndicator())
                        : CustomButton(
                            text: 'kirim',
                            callback: () {
                              final Future<Map<String, dynamic>>
                                  successfulMessage = provider.uploadButki(
                                widget.pesanan.id,
                                metodeBayarList[widget.method].title,
                                _image!,
                              );

                              successfulMessage.then((response) {
                                if (response['status']) {
                                  Navigator.pushNamed(context,
                                      RouteConstants.transisiPembayaran);
                                } else {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        'Terjadi kesalahan saat mengupload bukti pembayaran'),
                                    backgroundColor: ColorConstants.black,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              });
                            },
                          )
                    : SizedBox.shrink(),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
