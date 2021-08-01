import 'package:crowns/constants/metode_bayar.dart';
import 'package:crowns/modules/pembayaran/components/tawar_dialog.dart';
import 'package:crowns/modules/pembayaran/providers/pembayaran_provider.dart';
import 'package:crowns/modules/pembayaran/screens/pembayaran.dart';
import 'package:crowns/modules/pesanan/models/pesanan.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:flutter/material.dart';

import 'package:crowns/widgets/custom_button.dart';
import 'package:crowns/widgets/app_widgets.dart';
import 'package:crowns/constants/app_constants.dart';
import 'package:provider/provider.dart';

class DetailPembayaranPage extends StatefulWidget {
  final Pesanan pesanan;

  DetailPembayaranPage({required this.pesanan});

  @override
  _DetailPembayaranPageState createState() => _DetailPembayaranPageState();
}

class _DetailPembayaranPageState extends State<DetailPembayaranPage> {
  int _selected = -1;

  @override
  Widget build(BuildContext context) {
    // PembayaranProvider pembayaranProvider =
    //     Provider.of<PembayaranProvider>(context, listen: false);

    final padding = MediaQuery.of(context).padding;

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
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Biaya Jemput',
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
                  'Rp. ${widget.pesanan.pembayaran.biayaJahit}',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              SizedBox(height: 6),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Rp. ${widget.pesanan.pembayaran.biayaMaterial}',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              SizedBox(height: 6),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Rp. ${widget.pesanan.pembayaran.biayaKirim}',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              SizedBox(height: 6),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Rp. ${widget.pesanan.pembayaran.biayaKirim}',
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
          'Rp ${widget.pesanan.biayaTotal}',
          style: TextStyle(fontSize: 13),
        ),
      ],
    );

    final detilHari = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Estimasi Tanggal Selesai',
          style: TextStyle(fontSize: 13),
        ),
        Text(
          widget.pesanan.tawaran.hariTawar.toString().substring(0, 10),
          style: TextStyle(fontSize: 13),
        ),
      ],
    );

    final detilPembayaran = Column(
      children: [
        detilPembayaranInfo,
        SizedBox(height: 6),
        Container(
          color: ColorConstants.grey,
          height: 1,
          width: double.infinity,
        ),

        /// Detil Pembayaran Total
        SizedBox(height: 3),
        detilPembayaranTotal,
        SizedBox(height: 3),
        detilHari,
      ],
    );

    Container _buildPanel() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: appPadding),
        height: 270,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          key: Key(_selected.toString()),
          itemCount: metodeBayarList.length,
          itemBuilder: (context, i) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorConstants.softGrey,
              ),
              margin: EdgeInsets.only(bottom: 8),
              child: ExpansionTile(
                initiallyExpanded: i == _selected,
                onExpansionChanged: (bool isExpanded) {
                  if (isExpanded)
                    setState(() {
                      _selected = i;
                      print(i);
                    });
                  else
                    setState(() {
                      _selected = -1;
                    });
                },
                tilePadding: EdgeInsets.all(0),
                trailing: SizedBox.shrink(),
                title: Row(
                  children: [
                    SizedBox(width: 16),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                        color: _selected == i
                            ? ColorConstants.darkGrey
                            : Colors.white,
                      ),
                    ),
                    SizedBox(width: 12),
                    buildFormLabel(context, metodeBayarList[i].title),
                  ],
                ),
                children: [
                  Row(
                    children: [
                      SizedBox(width: 30),
                      Container(
                        height: 60,
                        width: 60,
                        child: Image.asset(metodeBayarList[i].logo),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: buildHeadline(
                                  context, metodeBayarList[i].number),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: buildBodyText2(
                                  context, metodeBayarList[i].name),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
    }

    return ChangeNotifierProvider<PembayaranProvider>(
      create: (context) => PembayaranProvider(),
      child: Consumer<PembayaranProvider>(
        builder: (context, provider, child) => SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              height: MediaQuery.of(context).size.height -
                  padding.top -
                  padding.bottom,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      appHeader,
                      SizedBox(height: 36),

                      /// Show image progress bar
                      Container(
                        width: 221,
                        child: Image.asset(ImageConstants.progressBar4),
                      ),
                      SizedBox(height: 24),

                      Padding(
                        padding: EdgeInsets.only(left: appPadding),
                        child: buildHeadline(context, 'Pembayaran'),
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.only(left: appPadding),
                        child: buildSubtitle(
                            context, 'Estimasi harga yang harus dibayar'),
                      ),
                      SizedBox(height: 20),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: appPadding),
                        child: detilPembayaran,
                      ),

                      SizedBox(height: 47),
                      widget.pesanan.tawaran.statusPenawaran == 1
                          ? CustomButton(
                              text: 'tawar',
                              callback: () => showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return TawarDialog(
                                    totalHarga: widget.pesanan.biayaTotal,
                                    idPesanan: widget.pesanan.id,
                                    pembayaranProvider: provider,
                                  );
                                },
                              ).then((value) {
                                setState(() {
                                  widget.pesanan.tawaran.statusPenawaran =
                                      value;
                                });
                              }),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: ColorConstants.softBlue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 3,
                              ),
                              child: widget.pesanan.tawaran.statusPenawaran == 2
                                  ? Text('Menunggu jawaban dari penjahit')
                                  : Text('Tawaran diterima'),
                            ),
                      SizedBox(height: 36),
                      Padding(
                        padding: const EdgeInsets.only(left: appPadding),
                        child: buildHeadline(context, 'Metode'),
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.only(left: appPadding),
                        child: buildSubtitle(context, 'Mau membayar dimana?'),
                      ),

                      _buildPanel(),

                      // SizedBox(height: 30),
                      CustomButton(
                        text: 'bayar',
                        callback: () {
                          if (_selected == -1) {
                            final snackBar = SnackBar(
                              content: Text(
                                  'Pilih metode pembayaran terlebih dahulu'),
                              backgroundColor: ColorConstants.black,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PembayaranPage(
                                  pesanan: widget.pesanan,
                                  method: _selected,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
