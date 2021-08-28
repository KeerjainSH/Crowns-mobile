import 'dart:io';

import 'package:crowns/constants/app_constants.dart';
import 'package:crowns/constants/metode_bayar.dart';
import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/pembayaran/components/widgets.dart';
import 'package:crowns/modules/pembayaran/models/biaya.dart';
import 'package:crowns/modules/pembayaran/providers/pembayaran_provider.dart';
import 'package:crowns/modules/pesanan/models/pesanan.dart';
import 'package:crowns/widgets/app_widgets.dart';
import 'package:crowns/widgets/custom_button.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class PembayaranPage extends StatefulWidget {
  final Pesanan pesanan;
  final int method;
  final Biaya biaya;

  PembayaranPage({
    required this.pesanan,
    required this.method,
    required this.biaya,
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
    final detailPembayaranInfo = Column(
      children: [
        buildDetail('Biaya jahit', 'Rp ' + widget.biaya.biayaJahit.toString()),
        buildDetail(
            'Biaya bahan', 'Rp ' + widget.biaya.biayaMaterial.toString()),
        buildDetail('Biaya Kirim', 'Rp ' + widget.biaya.biayaKirim.toString()),
        buildDetail(
            'Biaya Jemput', 'Rp ' + widget.biaya.biayaJemput.toString()),
        dividerLine,
        buildDetail(
            'Biaya total', 'Rp ' + widget.biaya.getBiayaTotal().toString()),
      ],
    );

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
              widget.pesanan.tawaran.statusPenawaran != 3
                  ? detailPembayaranInfo
                  : buildDetail('Total biaya',
                      'Rp ' + widget.pesanan.biayaTotal.toString()),
              SizedBox(height: 28),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  metodeBayarList[widget.method].subtitle,
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
