import 'package:crowns/widgets/app_header.dart';
import 'package:crowns/widgets/custom_button.dart';
import 'package:crowns/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:expandable/expandable.dart';

import 'package:crowns/widgets/texts.dart';

import 'package:crowns/utils/constants.dart';

class DetilPembayaranPage extends StatefulWidget {
  @override
  _DetilPembayaranPageState createState() => _DetilPembayaranPageState();
}

class _DetilPembayaranPageState extends State<DetilPembayaranPage> {
  String _selectedMethod = '';

  Widget _buildText12(text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final detilPembayaranInfo = Row(
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
    );

    final detilPembayaranTotal = Row(
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
    );

    ExpandablePanel buildMethodBayarTile(String text) {
      return ExpandablePanel(
        header: Container(
          decoration: BoxDecoration(
            color: ColorConstants.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          height: 25,
          width: MediaQuery.of(context).size.width - 64,
          child: Row(
            children: [
              SizedBox(width: 8),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: _selectedMethod == text
                      ? ColorConstants.darkGrey
                      : Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 12),
              _buildText12(text),
            ],
          ),
        ),
        collapsed: SizedBox.shrink(),
        expanded: Padding(
          padding: EdgeInsets.only(left: 24),
          child: Column(
            children: [
              SizedBox(height: 11),
              Container(
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      child: Padding(
                        padding: EdgeInsets.all(3),
                        child: Image.asset(ImageConstants.bankBRILogo),
                      ),
                    ),
                    _buildText12(methodBayarProvider[text]['name']),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
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
                child: Image.asset(ImageConstants.progressBar4),
              ),
              SizedBox(height: 24),

              Headline('Pembayaran'),
              SizedBox(height: 6),
              Subtitle('Estimasi harga yang harus dibayar'),
              SizedBox(height: 20),

              // Detil Pembayaran Info
              detilPembayaranInfo,
              SizedBox(height: 6),
              Container(
                color: ColorConstants.middleGrey,
                height: 1,
                width: double.infinity,
              ),

              /// Detil Pembayaran Total
              SizedBox(height: 3),
              detilPembayaranTotal,
              SizedBox(height: 47),
              buildButton(context, 'tawar', RouteConstants.detilPembayaran),
              SizedBox(height: 36),
              Headline('Metode'),
              SizedBox(height: 6),
              Subtitle('Mau membayar dimana?'),

              /// Method Transfer Bank
              Container(
                height: 500,
                child: ExpandableTheme(
                  data: ExpandableThemeData(
                    hasIcon: false,
                    tapHeaderToExpand: true,
                    useInkWell: true,
                  ),
                  child: ListView(
                    children: <Widget>[
                      buildMethodBayarTile('BRI'),
                      SizedBox(height: 10),
                      buildMethodBayarTile('BNI'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),

              SizedBox(height: 30),
              CustomButton(text: 'bayar', route: '/pembayaran'),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

const Map<String, dynamic> methodBayarProvider = {
  'BRI': {'number': '081081081081081', 'name': 'An. Hadi Prayetyo'},
  'BNI': {'number': '091091091091091', 'name': 'An. Hadi Seseno'},
};
