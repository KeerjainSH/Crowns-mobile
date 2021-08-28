import 'package:crowns/constants/app_constants.dart';
import 'package:crowns/constants/metode_bayar.dart';
import 'package:crowns/modules/pembayaran/components/tawar_dialog.dart';
import 'package:crowns/modules/pembayaran/components/widgets.dart';
import 'package:crowns/modules/pembayaran/models/biaya.dart';
import 'package:crowns/modules/pembayaran/providers/pembayaran_provider.dart';
import 'package:crowns/modules/pembayaran/screens/pembayaran.dart';
import 'package:crowns/modules/pesanan/models/pesanan.dart';
import 'package:crowns/widgets/app_widgets.dart';
import 'package:crowns/widgets/custom_button.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPembayaranPage extends StatefulWidget {
  final Pesanan pesanan;

  DetailPembayaranPage({required this.pesanan});

  @override
  _DetailPembayaranPageState createState() => _DetailPembayaranPageState();
}

class _DetailPembayaranPageState extends State<DetailPembayaranPage> {
  int _selected = -1;
  Biaya? _biaya;

  @override
  void initState() {
    _biaya = new Biaya(
      biayaJahit:
          (int.parse(widget.pesanan.pembayaran.biayaJahit) * 1.1).round(),
      biayaJemput: int.parse(widget.pesanan.pembayaran.biayaJemput),
      biayaKirim: int.parse(widget.pesanan.pembayaran.biayaKirim),
      biayaMaterial: int.parse(widget.pesanan.pembayaran.biayaMaterial),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    final detilPembayaran = Column(
      children: [
        widget.pesanan.tawaran.statusPenawaran != 3
            ? Column(
                children: [
                  buildDetail('Biaya jahit', 'Rp ' + this._biaya!.biayaJahit.toString()),
                  buildDetail('Biaya bahan', 'Rp ' + this._biaya!.biayaMaterial.toString()),
                  buildDetail('Biaya Kirim', 'Rp ' + this._biaya!.biayaKirim.toString()),
                  buildDetail('Biaya Jemput', 'Rp ' + this._biaya!.biayaJemput.toString()),
                  dividerLine,
                  buildDetail('Biaya total', 'Rp ' + this._biaya!.getBiayaTotal().toString()),
                  dividerLine,
                  buildDetail('Biaya yang harus dibayar', 'Rp ' + this._biaya!.getBiayaTotal().toString()),
                ],
              )
            : Column(
                children: [
                  buildDetail('Biaya awal', 'Rp ' + this._biaya!.getBiayaTotal().toString()),
                  SizedBox(height: 8),
                  buildDetail('Biaya setelah ditawar', 'Rp ' + widget.pesanan.biayaTotal.toString()),
                  dividerLine,
                  buildDetail(
                      'Biaya yang harus dibayar', 'Rp ' + widget.pesanan.biayaTotal.toString()),
                ],
              ),
        buildDetail('Estimasi tanggal selesai',
            widget.pesanan.tawaran.hariTawar.toString().substring(0, 10)),
      ],
    );

    Container _buildPanel() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: appPadding),
        height: 400,
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

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteConstants.pesanan,
          (route) => false,
        );
        return true;
      },
      child: ChangeNotifierProvider<PembayaranProvider>(
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
                              context, 'Detail harga yang harus dibayar'),
                        ),
                        SizedBox(height: 20),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: appPadding),
                          child: detilPembayaran,
                        ),

                        SizedBox(height: 36),
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
                                    if (value != null)
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
                                child:
                                    widget.pesanan.tawaran.statusPenawaran == 2
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
                                    biaya: _biaya!,
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
      ),
    );
  }
}
