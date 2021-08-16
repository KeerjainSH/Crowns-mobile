import 'package:crowns/modules/pesanan/models/detail_pesanan.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormDetailPesanan extends StatefulWidget {
  final DetailPesanan detailPesanan;

  FormDetailPesanan({required this.detailPesanan});

  @override
  _FormDetailPesananState createState() => _FormDetailPesananState();
}

class _FormDetailPesananState extends State<FormDetailPesanan> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 11),
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
                  buildUkuranBajuField(context, widget.detailPesanan, 'Lengan'),
                  buildUkuranBajuField(
                      context, widget.detailPesanan, 'Pinggang'),
                  buildUkuranBajuField(context, widget.detailPesanan, 'Dada'),
                ],
              ),
              SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildUkuranBajuField(context, widget.detailPesanan, 'Leher'),
                  buildUkuranBajuField(
                      context, widget.detailPesanan, 'Tinggi Tubuh'),
                  buildUkuranBajuField(
                      context, widget.detailPesanan, 'Berat Badan'),
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
    BuildContext context, DetailPesanan detailPesanan, String text) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.22,
    child: Column(
      children: [
        buildFormLabel3(context, text),
        Align(
          alignment: Alignment.centerLeft,
          child: TextFormField(
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
