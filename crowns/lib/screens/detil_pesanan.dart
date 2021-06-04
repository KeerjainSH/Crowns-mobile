import 'package:flutter/material.dart';

import 'package:crowns/widgets/ukuran_baju_form_field.dart';

import 'package:crowns/utils/color_constants.dart';
import 'package:crowns/utils/image_constants.dart';
import 'package:flutter/services.dart';

class DetilPesananPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorConstants.backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: ColorConstants.grey,
                    blurRadius: 6,
                    offset: Offset(0, 8),
                    spreadRadius: 0,
                  )
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image.asset(
                      ImageConstants.seragamProduc1,
                    ),
                  ),
                  SizedBox(width: 17),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
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
                        ),
                        Row(
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
                                Container(
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
                                SizedBox(width: 3),
                                Container(
                                  height: 18,
                                  width: 43,
                                  color: ColorConstants.middleGrey,
                                  child: Center(
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 3),
                                Container(
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
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
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
                            UkuranBajuFormField(
                              label: 'Pinggang',
                            ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
