import 'dart:io';

import 'package:crowns/provider/auth_provider.dart';
import 'package:flutter/material.dart';

import 'package:crowns/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class DetilPesananPage extends StatefulWidget {
  @override
  _DetilPesananPageState createState() => _DetilPesananPageState();
}

enum StatusUploadDesain {
  Starting,
  DesainSendiri,
  DesainPenjahit,
  Uploaded,
}

class DetailPesanan {
  String nama;
  int ukuranLengan;
  int ukuranLeher;
  int ukuranPinggang;
  int tinggiTubuh;
  int ukuranDada;
  int BeratBadan;
  String instruksi;

  DetailPesanan({
    required this.nama,
    required this.ukuranDada,
    required this.ukuranLeher,
    required this.ukuranLengan,
    required this.ukuranPinggang,
    required this.BeratBadan,
    required this.tinggiTubuh,
    required this.instruksi,
  });
}

class _DetilPesananPageState extends State<DetilPesananPage> {
  File? _image;
  final picker = ImagePicker();

  int _count = 1;

  StatusUploadDesain _state = StatusUploadDesain.Starting;

  Future getImageFromGallery() async {
    print('getImage');
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _state = StatusUploadDesain.Uploaded;
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final productPicture = Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.0),
        child: _state == StatusUploadDesain.Uploaded
            ? Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.file(
                      _image!,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  InkWell(
                    onTap: getImageFromGallery,
                    child: Container(
                      color: ColorConstants.grey.withOpacity(0.3),
                      height: double.infinity,
                      width: double.infinity,
                      child: Center(
                        child: Icon(Icons.edit),
                      ),
                    ),
                  ),
                ],
              )
            : Image.asset(
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
        Text(
          'Jumlah',
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  if (_count > 1) _count--;
                });
              },
              child: Container(
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
            ),
            SizedBox(width: 3),
            Container(
              height: 18,
              width: 43,
              color: ColorConstants.middleGrey,
              child: Center(
                child: Text(
                  "$_count",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(width: 3),
            InkWell(
              onTap: () {
                setState(() {
                  _count++;
                });
              },
              child: Container(
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
            ),
          ],
        ),
      ],
    );

    final header = Container(
      decoration: BoxDecoration(
        color: ColorConstants.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: ColorConstants.grey,
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

          /// Form input detail pesanan
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _count,
              itemBuilder: (context, i) {
                return FormDetilPesanan(counter: i);
              },
            ),
          ),
        ],
      ),
    );

    final submitButton = Container(
      padding: EdgeInsets.symmetric(horizontal: 23),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: 125,
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
          onPressed: () {
            Navigator.pushNamed(context, RouteConstants.isiAlamat);
          },
          child: Text(
            'pesan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );

    final question = Container(
      decoration: BoxDecoration(
        color: ColorConstants.softBlue,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.symmetric(horizontal: 23),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 7,
            child: Text(
              'Apakah kamu ingin memakai desain sendiri?',
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _state = StatusUploadDesain.DesainSendiri;
                      });
                      print(_state);
                    },
                    child: Text('Ya'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontFamily: 'SFProDisplay'),
                      primary: ColorConstants.primaryColor,
                      visualDensity: VisualDensity.compact,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _state = StatusUploadDesain.DesainPenjahit;
                      });
                    },
                    child: Text('Tidak'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontFamily: 'SFProDisplay'),
                      primary: ColorConstants.softBlue,
                      visualDensity: VisualDensity.compact,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    final uploadDesain = Container(
      decoration: BoxDecoration(
        color: ColorConstants.softBlue,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.symmetric(horizontal: 23),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              'Upload desain kamu di sini!',
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  onPressed: getImageFromGallery,
                  child: Text('Pilih Gambar'),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontFamily: 'SFProDisplay'),
                    primary: ColorConstants.primaryColor,
                    visualDensity: VisualDensity.comfortable,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // final uploadedImage = Container(
    //   child: Image.file(_image!),
    // );

    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            header,
            SizedBox(height: 15),
            _state == StatusUploadDesain.Starting
                ? question
                : SizedBox.shrink(),
            _state == StatusUploadDesain.DesainSendiri
                ? uploadDesain
                : SizedBox.shrink(),
            // _state == StatusUploadDesain.Uploaded
            //     ? uploadedImage
            //     : SizedBox.shrink(),
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

class FormDetilPesanan extends StatelessWidget {
  int counter;

  FormDetilPesanan({required this.counter});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        counter > 0
            ? Container(
                height: 1,
                color: ColorConstants.middleGrey,
              )
            : Container(),
        SizedBox(height: 11),
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
                  UkuranBajuFormField(label: 'Pinggang'),
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
        SizedBox(height: 22),
      ],
    );
  }
}

class UkuranBajuFormField extends StatelessWidget {
  final String label;

  UkuranBajuFormField({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              this.label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: ColorConstants.darkGrey,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: ColorConstants.grey,
              borderRadius: BorderRadius.circular(8),
            ),
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
        ],
      ),
    );
  }
}
