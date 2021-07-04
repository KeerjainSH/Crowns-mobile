import 'package:crowns/modules/pesanan/models/detail_pesanan.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:flutter/material.dart';

class FormDetailPesanan extends StatefulWidget {
  DetailPesanan detailPesanan;
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
          onSaved: (value) => widget.detailPesanan.nama_lengkap = value!,
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
                widget.detailPesanan.instruksi_pembuatan = value!,
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
            onSaved: (value) {
              if (text == 'Lengan')
                detailPesanan.lengan = int.parse(value!);
              else if (text == 'Pinggang')
                detailPesanan.pinggang = int.parse(value!);
              else if (text == 'Dada')
                detailPesanan.dada = int.parse(value!);
              else if (text == 'Leher')
                detailPesanan.leher = int.parse(value!);
              else if (text == 'Tinggi tubuh')
                detailPesanan.tinggi_tubuh = int.parse(value!);
              else if (text == 'Berat Badan')
                detailPesanan.berat_badan = int.parse(value!);
            },
          ),
        ),
      ],
    ),
  );
}
