import 'package:crowns/modules/pembayaran/components/tawar_dialog.dart';
import 'package:crowns/modules/pembayaran/models/metode_bayar.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:flutter/material.dart';

import 'package:crowns/widgets/custom_button.dart';
import 'package:crowns/widgets/app_widgets.dart';
import 'package:crowns/constants/app_constants.dart';

class DetailPembayaranPage extends StatefulWidget {
  @override
  _DetailPembayaranPageState createState() => _DetailPembayaranPageState();
}

class _DetailPembayaranPageState extends State<DetailPembayaranPage> {
  int _selected = -1;

  @override
  Widget build(BuildContext context) {
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
    );

    final detilPembayaranTotal = Row(
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
      ],
    );

    Container _buildPanel() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: appPadding),
        height: 300,
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height:
              MediaQuery.of(context).size.height - padding.top - padding.bottom,
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
                  CustomButton(
                    text: 'tawar',
                    callback: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return TawarDialog();
                      },
                    ),
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

                  SizedBox(height: 30),
                  CustomButton(
                    text: 'bayar',
                    callback: () => Navigator.pushNamed(context, '/pembayaran'),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<MetodeBayar> metodeBayarList = [
  MetodeBayar(
    title: 'Bank BRI',
    number: '091091091',
    logo: ImageConstants.bankBRILogo,
    name: 'Ananda Bagus',
  ),
  MetodeBayar(
    title: 'Bank BCA',
    number: '091091091',
    logo: ImageConstants.bankBCAlogo,
    name: 'Ananda Bagus',
  ),
  MetodeBayar(
    title: 'Bank BNI',
    number: '091091091',
    logo: ImageConstants.bankBNIlogo,
    name: 'Ananda Bagus',
  ),
];
