import 'package:flutter/material.dart';

import 'package:crowns/widgets/app_header.dart';
import 'package:crowns/widgets/texts.dart';

import 'package:crowns/utils/color_constants.dart';
import 'package:crowns/widgets/custom_button.dart';

class PembayaranPage extends StatefulWidget {
  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}
class _PembayaranPageState extends State<PembayaranPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 41),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: AppHeader(),
            ),
            SizedBox(height: 34),
            Text(
              'Menunggu Konfirmasi Pembayaran',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.middleGrey),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 21),
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
            ),
            SizedBox(height: 34),
            CustomButton(text: 'selesai', route: '/'),
          ],
        ),
      ),
    );
  }
}
