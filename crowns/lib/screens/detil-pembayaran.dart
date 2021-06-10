import 'package:crowns/utils/color_constants.dart';
import 'package:crowns/widgets/app_header.dart';
import 'package:crowns/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:crowns/widgets/texts.dart';

import 'package:crowns/utils/image_constants.dart';

class DetilPembayaranPage extends StatefulWidget {
  @override
  _DetilPembayaranPageState createState() => _DetilPembayaranPageState();
}

class _DetilPembayaranPageState extends State<DetilPembayaranPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              SizedBox(height: 41),
              AppHeader(),
              SizedBox(height: 36),

              /// Show image progress bar
              Container(
                width: 221,
                child: Image.asset(ImageConstants.progressBar3),
              ),
              SizedBox(height: 24),

              Headline('Pembayaran'),
              SizedBox(height: 6),
              Subtitle('Estimasi harga yang harus dibayar'),
              SizedBox(height: 20),
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
              SizedBox(height: 47),
              CustomButton(text: 'tawar', route: 'detil-pembayaran'),
              SizedBox(height: 36),
              Headline('Metode'),
              SizedBox(height: 6),
              Subtitle('Mau membayar dimana?'),
              ListContentItem('Bayar di Tempat'),
              SizedBox(height: 8),
              ListContentItem('Transfer Bank'),
              SizedBox(height: 8),
              ListContentItem('Uang Elektronik'),
              SizedBox(height: 30),
              CustomButton(text: 'bayar', route: 'detil-pembayaran'),
            ],
          ),
        ),
      ),
    );
  }
}

class ListContentItem extends StatelessWidget {
  final String text;

  ListContentItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 25,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 8),
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
