import 'package:flutter/material.dart';

import 'package:crowns/widgets/app_header.dart';
import 'package:crowns/widgets/form_label.dart';
import 'package:crowns/widgets/custom_text_field.dart';
import 'package:crowns/widgets/sub_form_label.dart';
import 'package:crowns/widgets/custom_button.dart';

import 'package:crowns/utils/image_constants.dart';
import 'package:crowns/utils/color_constants.dart';

class IsiAlamatPage extends StatefulWidget {
  @override
  _IsiAlamatPageState createState() => _IsiAlamatPageState();
}

class _IsiAlamatPageState extends State<IsiAlamatPage> {
  int _state = 1;

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

              /// Button choice
              Center(
                child: Container(
                  width: 227,
                  child: _state == 1
                      ? Stack(
                          /// if state if Di Ambil
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    width: 145, height: 42),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    textStyle:
                                        TextStyle(fontFamily: 'SFProDisplay'),
                                    primary: ColorConstants.backgroundColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(180.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _state = 2;
                                    });
                                  },
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Antar Sendiri",
                                      style: TextStyle(
                                        color: ColorConstants.primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(180.0),
                                  color: ColorConstants.primaryColor,
                                ),
                                width: 114,
                                height: 42,
                                child: Center(
                                  child: Text(
                                    "Di Ambil",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Stack(
                          /// if state is Antar Sendiri
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    width: 145, height: 42),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    textStyle:
                                        TextStyle(fontFamily: 'SFProDisplay'),
                                    primary: ColorConstants.backgroundColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(180.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _state = 1;
                                    });
                                  },
                                  child: Text(
                                    "Di Ambil",
                                    style: TextStyle(
                                      color: ColorConstants.primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(180.0),
                                  color: ColorConstants.primaryColor,
                                ),
                                width: 114,
                                height: 42,
                                child: Center(
                                  child: Text(
                                    "Antar Sendiri",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),

              SizedBox(height: 22),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Lokasi Kamu',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Isi dengan benar ya!',
                      style: TextStyle(color: ColorConstants.darkGrey),
                    ),
                  ),
                  Container(
                    height: 203,
                    color: ColorConstants.grey,
                  ),
                  SizedBox(height: 15),
                  FormLabel('Alamat Penjemputan'),
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
                  FormLabel('Instruksi penjemputan'),
                  SizedBox(height: 5),
                  CustomTextField(5),
                  SizedBox(height: 8),
                  FormLabel('Waktu Penjemputan'),
                  SizedBox(height: 6),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SubFormLabel('Tanggal'),
                            SizedBox(height: 2),
                          ],
                        ),
                        Column(
                          children: [
                            SubFormLabel('Jam'),
                            SizedBox(height: 2),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  CustomButton('berikutnya'),
                  SizedBox(height: 40),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
