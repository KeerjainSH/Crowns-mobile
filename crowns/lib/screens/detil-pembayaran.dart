import 'package:crowns/utils/color_constants.dart';
import 'package:crowns/widgets/app_header.dart';
import 'package:crowns/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:crowns/widgets/configurable_expansion_tile.dart';

import 'package:crowns/widgets/texts.dart';

import 'package:crowns/utils/image_constants.dart';

class DetilPembayaranPage extends StatefulWidget {
  @override
  _DetilPembayaranPageState createState() => _DetilPembayaranPageState();
}

class _DetilPembayaranPageState extends State<DetilPembayaranPage> {
  int _selectedMethod = 1;
  int _selectedProvider = 1;

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
              SizedBox(height: 47),
              CustomButton(text: 'tawar', route: 'detil-pembayaran'),
              SizedBox(height: 36),
              Headline('Metode'),
              SizedBox(height: 6),
              Subtitle('Mau membayar dimana?'),
              SizedBox(height: 16),

              /// Method Bayar di Tempat
              ConfigurableExpansionTile(
                header: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedMethod = 1;
                    });
                  },
                  child: Container(
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
                            color: _selectedMethod == 1
                                ? ColorConstants.darkGrey
                                : Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        _buildText12('Bayar di Tempat'),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),

              /// Method Transfer Bank
              ConfigurableExpansionTile(
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
                          color: _selectedMethod == 2
                              ? ColorConstants.darkGrey
                              : Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 12),
                      _buildText12('Transfer Bank'),
                    ],
                  ),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Column(
                      children: [
                        SizedBox(height: 11),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedMethod = 2;
                              _selectedProvider = 1;
                            });
                          },
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                              color:
                                  _selectedMethod == 2 && _selectedProvider == 1
                                      ? ColorConstants.softBlue
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child:
                                        Image.asset(ImageConstants.bankBCAlogo),
                                  ),
                                ),
                                _buildText12('Bank BCA'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedMethod = 2;
                              _selectedProvider = 2;
                            });
                          },
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                              color:
                                  _selectedMethod == 2 && _selectedProvider == 2
                                      ? ColorConstants.softBlue
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Image.asset(
                                        ImageConstants.bankMandiriLogo),
                                  ),
                                ),
                                _buildText12('Bank Mandiri'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedMethod = 2;
                              _selectedProvider = 3;
                            });
                          },
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                              color:
                                  _selectedMethod == 2 && _selectedProvider == 3
                                      ? ColorConstants.softBlue
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child:
                                        Image.asset(ImageConstants.bankBNIlogo),
                                  ),
                                ),
                                _buildText12('Bank BNI'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedMethod = 2;
                              _selectedProvider = 4;
                            });
                          },
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                              color:
                                  _selectedMethod == 2 && _selectedProvider == 4
                                      ? ColorConstants.softBlue
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child:
                                        Image.asset(ImageConstants.bankBRILogo),
                                  ),
                                ),
                                _buildText12('Bank BRI'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),

              /// Method Uang Elektronik
              ConfigurableExpansionTile(
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
                          color: _selectedMethod == 3
                              ? ColorConstants.darkGrey
                              : Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 12),
                      _buildText12('Uang Elektronik'),
                    ],
                  ),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Column(
                      children: [
                        SizedBox(height: 11),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedMethod = 3;
                              _selectedProvider = 1;
                            });
                          },
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                              color:
                                  _selectedMethod == 3 && _selectedProvider == 1
                                      ? ColorConstants.softBlue
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Image.asset(ImageConstants.ovoLogo),
                                  ),
                                ),
                                _buildText12('OVO'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedMethod = 3;
                              _selectedProvider = 2;
                            });
                          },
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                              color:
                                  _selectedMethod == 3 && _selectedProvider == 2
                                      ? ColorConstants.softBlue
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child: Image.asset(ImageConstants.danaLogo),
                                  ),
                                ),
                                _buildText12('DANA'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedMethod = 3;
                              _selectedProvider = 3;
                            });
                          },
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                              color:
                                  _selectedMethod == 3 && _selectedProvider == 3
                                      ? ColorConstants.softBlue
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child:
                                        Image.asset(ImageConstants.linkAjaLogo),
                                  ),
                                ),
                                _buildText12('Link Aja'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedMethod = 3;
                              _selectedProvider = 4;
                            });
                          },
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                              color:
                                  _selectedMethod == 3 && _selectedProvider == 4
                                      ? ColorConstants.softBlue
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  child: Padding(
                                    padding: EdgeInsets.all(3),
                                    child:
                                        Image.asset(ImageConstants.gopayLogo),
                                  ),
                                ),
                                _buildText12('Gopay'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),

              // Method Kartu Kredit
              ConfigurableExpansionTile(
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
                          color: _selectedMethod == 4
                              ? ColorConstants.darkGrey
                              : Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 12),
                      _buildText12('Kartu Kredit'),
                    ],
                  ),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Column(
                      children: [
                        SizedBox(height: 11),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedMethod = 4;
                              _selectedProvider = 1;
                            });
                          },
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                              color:
                                  _selectedMethod == 4 && _selectedProvider == 1
                                      ? ColorConstants.softBlue
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  child: Padding(
                                      padding: EdgeInsets.all(3),
                                      child: FittedBox(
                                          child: Icon(Icons.credit_card))),
                                ),
                                _buildText12('Bank BCA'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
