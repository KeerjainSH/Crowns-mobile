import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:crowns/constants/api_path.dart';
import 'package:crowns/constants/app_constants.dart';
import 'package:crowns/modules/pembayaran/screens/detail_pembayaran.dart';
import 'package:crowns/modules/pesanan/components/rating_dialog.dart';
import 'package:crowns/modules/pesanan/models/pesanan.dart';
import 'package:crowns/modules/pesanan/providers/pesanan_provider.dart';
import 'package:crowns/modules/pesanan/screens/detail_pesanan_lookback.dart';
import 'package:crowns/widgets/app_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PesananScreen extends StatefulWidget {
  const PesananScreen({Key? key}) : super(key: key);

  @override
  _PesananScreenState createState() => _PesananScreenState();
}

class _PesananScreenState extends State<PesananScreen> {
  String _currState = 'Semua';

  Future<List<Map<String, dynamic>>>? pesanan;

  @override
  Widget build(BuildContext context) {
    PesananProvider pesananProvider =
        Provider.of<PesananProvider>(context, listen: false);

    var padding = MediaQuery.of(context).padding;

    final appBar = AppBar(
      title: Text(
        'Pesanan',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
    );

    Align tile(Pesanan pesanan) {
      return Align(
        alignment: Alignment.topCenter,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailPesananLookbackPage(pesanan: pesanan),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: ColorConstants.grey,
                  offset: Offset(0, 2),
                  blurRadius: 1,
                ),
              ],
            ),
            margin: EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width * 0.9,
            height: 120,
            child: Row(
              children: [
                Container(
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage(
                      image: NetworkImage(pesanan.baju.foto),
                      placeholder: AssetImage(ImageConstants.appLogo),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Image.network(pesanan.baju.foto)),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 2),
                        margin: EdgeInsets.only(bottom: 4),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1, color: ColorConstants.grey),
                          ),
                        ),
                        child: Text(
                          'Pesanan ' + pesanan.created_at,
                          style: TextStyle(fontSize: 9),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(pesanan.status_pesanan.toString() +
                            ' ' +
                            pesanan.pembayaran.status_pembayaran.toString() +
                            ' ' +
                            pesanan.tawaran.status_penawaran.toString() +
                            ' - ' +
                            pesanan.baju.nama),
                      ),
                      SizedBox(height: 2),
                      SizedBox(height: 6),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorConstants.softBlue,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 3,
                          ),
                          child: pesanan.status_pesanan == 3 // pesanan baru
                              ? pesanan.pembayaran.status_pembayaran == 1
                                  ? Text(
                                      'Menunggu penjahit mengisi harga',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: ColorConstants.primaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  : Text(
                                      'Menunggu pembayaran',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: ColorConstants.primaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                              : pesanan.status_pesanan == 4
                                  ? pesanan.pembayaran.status_pembayaran == 4
                                      ? Text(
                                          'Baju sedang dikerjakan',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: ColorConstants.primaryColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      : Text(
                                          'Menunggu pembayaran diterima',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: ColorConstants.primaryColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                  : Text(
                                      'Pesanan Selesai',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: ColorConstants.primaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          pesanan.pembayaran.status_pembayaran > 1
                              ? Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Text(
                                        'Total belanja',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Rp. ' + pesanan.biaya_total,
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : SizedBox.shrink(),
                          pesanan.status_pesanan == 3
                              ? pesanan.pembayaran.status_pembayaran == 1
                                  ? SizedBox.shrink()
                                  : InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailPembayaranPage(
                                              pesanan: pesanan,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: ColorConstants.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 3,
                                        ),
                                        child: Text(
                                          'Menuju pembayaran',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    )
                              : pesanan.status_pesanan == 5
                                  ? pesanan.rating == 0
                                      ? InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return RatingDialog(
                                                  pesanan: pesanan,
                                                  pesananProvider:
                                                      pesananProvider,
                                                );
                                              },
                                            ).then((value) {
                                              setState(() {
                                                pesanan.rating = value;
                                              });
                                            });
                                          },
                                          child: Text(
                                            'Beri rating',
                                            style: TextStyle(
                                                color: ColorConstants
                                                    .primaryColor),
                                          ),
                                        )
                                      : Container(
                                          margin: EdgeInsets.only(right: 5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                pesanan.rating.toString(),
                                                style: TextStyle(
                                                  color:
                                                      ColorConstants.darkGrey,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              SvgPicture.asset(
                                                  ImageConstants.starIcon),
                                            ],
                                          ),
                                        )
                                  : SizedBox.shrink(),
                        ],
                      ),
                      SizedBox.shrink(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    Container buildTileContent(List<Pesanan> data) {
      return Container(
        margin: EdgeInsets.only(bottom: 80),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, i) => tile(data[i]),
          ),
        ),
      );
    }

    return Provider(
      lazy: false,
      create: (context) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          pesanan = pesananProvider.fetchAllPesanan();
          setState(() {});
        });
      },
      dispose: (context, data) => pesananProvider.resetPesananBelumValid(),
      child: SafeArea(
        child: Scaffold(
          appBar: appBar,
          backgroundColor: Colors.white,
          body: DefaultTabController(
            length: 3,
            child: Column(
              children: <Widget>[
                ButtonsTabBar(
                  physics: NeverScrollableScrollPhysics(),
                  backgroundColor: ColorConstants.primaryColor,
                  unselectedBackgroundColor: ColorConstants.grey,
                  unselectedLabelStyle: TextStyle(color: Colors.black),
                  labelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  tabs: [
                    Tab(text: "Pesanan Baru"),
                    Tab(text: "Dikerjakan"),
                    Tab(text: "Selesai"),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      FutureBuilder(
                        future: pesanan,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData)
                            return SingleChildScrollView(
                                child:
                                    buildTileContent(snapshot.data[0]['data']));
                          else if (snapshot.hasError)
                            return Center(
                                child: Text(
                                    'Terjadi kesalahan saat mengambil data'));

                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                      FutureBuilder(
                        future: pesanan,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData)
                            return SingleChildScrollView(
                                child:
                                    buildTileContent(snapshot.data[1]['data']));
                          else if (snapshot.hasError)
                            return Center(
                                child: Text(
                                    'Terjadi kesalahan saat mengambil data'));

                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                      FutureBuilder(
                        future: pesanan,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData)
                            return SingleChildScrollView(
                                child:
                                    buildTileContent(snapshot.data[2]['data']));
                          else if (snapshot.hasError)
                            return Center(
                                child: Text(
                                    'Terjadi kesalahan saat mengambil data'));

                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          extendBody: true,
          bottomNavigationBar: navbar,
        ),
      ),
    );
  }
}
