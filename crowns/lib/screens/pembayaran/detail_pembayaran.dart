import 'package:flutter/material.dart';

import 'package:crowns/widgets/custom_button.dart';
import 'package:crowns/widgets/widgets.dart';
import 'package:crowns/utils/constants.dart';

class DetailPembayaranPage extends StatefulWidget {
  @override
  _DetailPembayaranPageState createState() => _DetailPembayaranPageState();
}

class _DetailPembayaranPageState extends State<DetailPembayaranPage> {
  int _selected = -1;

  Widget _buildText12(text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          color: ColorConstants.middleGrey,
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
        padding: EdgeInsets.symmetric(horizontal: 32),
        height: 300,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          key: Key(_selected.toString()),
          itemCount: metodeBayarList.length,
          itemBuilder: (context, i) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: ColorConstants.grey,
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
                      _buildText12(metodeBayarList[i].title),
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
                                child: buildBigHeavyText(
                                    metodeBayarList[i].number),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: buildGreyText13(metodeBayarList[i].name),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 41),
              appHeader,
              SizedBox(height: 36),

              /// Show image progress bar
              Container(
                width: 221,
                child: Image.asset(ImageConstants.progressBar4),
              ),
              SizedBox(height: 24),

              buildHeadline('Pembayaran'),
              SizedBox(height: 6),
              buildHeadlineSub('Estimasi harga yang harus dibayar'),
              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: detilPembayaran,
              ),

              SizedBox(height: 47),
              CustomButton(
                text: 'tawar',
                callback: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return TawarDialog();
                    }),
              ),
              SizedBox(height: 36),
              buildHeadline('Metode'),
              SizedBox(height: 6),
              buildHeadlineSub('Mau membayar dimana?'),

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
    );
  }
}

class TawarDialog extends StatefulWidget {
  @override
  _TawarDialogState createState() => _TawarDialogState();
}

Align buildDialogTextLabel(String text) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

class _TawarDialogState extends State<TawarDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Tawar',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 25),
            buildDialogTextLabel('Harga dari penjahit'),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Biaya:'),
                  Text('Rp. 440.000'),
                ],
              ),
            ),
            SizedBox(height: 20),
            buildDialogTextLabel('Biaya yang ingin kamu tawarkan'),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Harga: '),
                        Text('Rp. '),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text('Hari: '),
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(isDense: true),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ColorConstants.primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Kirim tawaran',
                    style: TextStyle(
                      // color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<MetodeBayarClass> metodeBayarList = [
  MetodeBayarClass(
    title: 'Bank BRI',
    number: '091091091',
    logo: ImageConstants.bankBRILogo,
    name: 'Ananda Bagus',
  ),
  MetodeBayarClass(
    title: 'Bank BCA',
    number: '091091091',
    logo: ImageConstants.bankBCAlogo,
    name: 'Ananda Bagus',
  ),
  MetodeBayarClass(
    title: 'Bank BNI',
    number: '091091091',
    logo: ImageConstants.bankBNIlogo,
    name: 'Ananda Bagus',
  ),
];

class MetodeBayarClass {
  MetodeBayarClass({
    required this.title,
    required this.number,
    required this.logo,
    this.name = '',
  });

  String title;
  String number;
  String name;
  String logo;
}
