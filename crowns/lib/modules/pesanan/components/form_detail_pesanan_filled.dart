import 'package:crowns/modules/pesanan/models/detail_pesanan.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:flutter/material.dart';

class FormDetailPesananFilled extends StatefulWidget {
  DetailPesanan detailPesanan;
  FormDetailPesananFilled({required this.detailPesanan});

  @override
  _FormDetailPesananFilledState createState() =>
      _FormDetailPesananFilledState();
}

class _FormDetailPesananFilledState extends State<FormDetailPesananFilled> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 11),
        buildFormLabel2(context, 'Nama Lengkap'),
        SizedBox(height: 5),
        TextFormField(
          initialValue: widget.detailPesanan.nama_lengkap,
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
            initialValue: widget.detailPesanan.instruksi_pembuatan,
          ),
        ),
        SizedBox(height: 22),
      ],
    );
  }
}

Container buildUkuranBajuField(
    BuildContext context, DetailPesanan detailPesanan, String text) {
  var value;

  if (text == 'Lengan')
    value = detailPesanan.lengan.toString();
  else if (text == 'Pinggang')
    value = detailPesanan.pinggang.toString();
  else if (text == 'Dada')
    value = detailPesanan.dada.toString();
  else if (text == 'Leher')
    value = detailPesanan.leher.toString();
  else if (text == 'Tinggi tubuh')
    value = detailPesanan.tinggi_tubuh.toString();
  else if (text == 'Berat Badan') value = detailPesanan.berat_badan.toString();

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
            initialValue: value,
          ),
        ),
      ],
    ),
  );
}
