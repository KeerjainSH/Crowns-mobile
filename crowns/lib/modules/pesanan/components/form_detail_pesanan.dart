import 'package:crowns/constants/app_constants.dart';
import 'package:crowns/constants/ukuran_baju.dart';
import 'package:crowns/modules/pesanan/models/detail_pesanan.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormDetailPesanan extends StatefulWidget {
  final DetailPesanan detailPesanan;
  final String jenisKelamin;

  FormDetailPesanan({
    required this.detailPesanan,
    required this.jenisKelamin,
  });

  @override
  _FormDetailPesananState createState() => _FormDetailPesananState();
}

class _FormDetailPesananState extends State<FormDetailPesanan> {
  final TextEditingController _lenganController = TextEditingController();
  final TextEditingController _pinggangController = TextEditingController();
  final TextEditingController _dadaController = TextEditingController();
  final TextEditingController _leherController = TextEditingController();
  final TextEditingController _dummyController = TextEditingController();

  @override
  void dispose() {
    _lenganController.dispose();
    _pinggangController.dispose();
    _dadaController.dispose();
    _leherController.dispose();
    _dummyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextButton buildUkuranButton(String ukuran) {
      return TextButton(
        style: TextButton.styleFrom(
          primary: ColorConstants.primaryColor,
          visualDensity: VisualDensity.compact,
          backgroundColor: ColorConstants.softGrey,
        ),
        onPressed: () {
          setState(() {
            _lenganController.text = widget.jenisKelamin == 'L'
                ? (ukuranBaju[ukuran]!['lengan']! + 2).toString()
                : ukuranBaju[ukuran]!['lengan'].toString();
            _pinggangController.text = widget.jenisKelamin == 'L'
                ? (ukuranBaju[ukuran]!['pinggang']! + 2).toString()
                : ukuranBaju[ukuran]!['pinggang'].toString();
            _dadaController.text = widget.jenisKelamin == 'L'
                ? (ukuranBaju[ukuran]!['dada']! + 2).toString()
                : ukuranBaju[ukuran]!['dada'].toString();
            _leherController.text = widget.jenisKelamin == 'L'
                ? (ukuranBaju[ukuran]!['leher']! + 2).toString()
                : ukuranBaju[ukuran]!['leher'].toString();
          });
        },
        child: Text(ukuran),
      );
    }

    return Column(
      children: [
        SizedBox(height: 11),
        buildFormLabel(context, 'Pilih ukuran template'),
        Row(
          children: [
            buildUkuranButton('S'),
            buildUkuranButton('M'),
            buildUkuranButton('L'),
            buildUkuranButton('XL'),
          ],
        ),
        buildFormLabel2(context, 'Nama Lengkap'),
        SizedBox(height: 5),
        TextFormField(
          validator: (value) => value == '' ? 'harus diisi' : null,
          onSaved: (value) => widget.detailPesanan.namaLengkap = value!,
        ),
        SizedBox(height: 8),
        buildFormLabel2(context, 'Ukuran Baju'),
        SizedBox(height: 1),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildUkuranBajuField(context, widget.detailPesanan, 'Lengan',
                      _lenganController),
                  buildUkuranBajuField(context, widget.detailPesanan,
                      'Pinggang', _pinggangController),
                  buildUkuranBajuField(
                      context, widget.detailPesanan, 'Dada', _dadaController),
                ],
              ),
              SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildUkuranBajuField(
                      context, widget.detailPesanan, 'Leher', _leherController),
                  buildUkuranBajuField(context, widget.detailPesanan,
                      'Tinggi Tubuh', _dummyController),
                  buildUkuranBajuField(context, widget.detailPesanan,
                      'Berat Badan', _dummyController),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        buildFormLabel2(context, 'Instruksi Pembuatan'),
        SizedBox(height: 5),
        Align(
          alignment: Alignment.centerLeft,
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            minLines: 4,
            maxLines: null,
            validator: (value) => value == '' ? 'harus diisi' : null,
            onSaved: (value) =>
                widget.detailPesanan.instruksiPembuatan = value!,
          ),
        ),
        SizedBox(height: 22),
      ],
    );
  }
}

Container buildUkuranBajuField(
  BuildContext context,
  DetailPesanan detailPesanan,
  String text,
  TextEditingController controller,
) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.22,
    child: Column(
      children: [
        buildFormLabel3(context, text),
        Align(
          alignment: Alignment.centerLeft,
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 3,
              ),
            ),
            validator: (value) => value == '' ? 'harus diisi' : null,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            onSaved: (value) {
              if (text == 'Lengan')
                detailPesanan.lengan = double.parse(value!);
              else if (text == 'Pinggang')
                detailPesanan.pinggang = double.parse(value!);
              else if (text == 'Dada')
                detailPesanan.dada = double.parse(value!);
              else if (text == 'Leher')
                detailPesanan.leher = double.parse(value!);
              else if (text == 'Tinggi Tubuh')
                detailPesanan.tinggiTubuh = double.parse(value!);
              else if (text == 'Berat Badan')
                detailPesanan.beratBadan = double.parse(value!);
            },
          ),
        ),
      ],
    ),
  );
}
