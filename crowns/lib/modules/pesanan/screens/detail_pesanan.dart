import 'package:crowns/modules/pesanan/models/alamat.dart';
import 'package:crowns/modules/pesanan/models/alamat_penjahit.dart';
import 'package:crowns/modules/pesanan/models/detail_pesanan.dart';
import 'package:crowns/modules/pesanan/models/pesanan.dart';
import 'package:crowns/modules/pesanan/providers/penjahit_provider.dart';
import 'package:flutter/material.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:crowns/constants/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPesananPage extends StatefulWidget {
  final Pesanan pesanan;

  DetailPesananPage({required this.pesanan});

  @override
  _DetailPesananPageState createState() => _DetailPesananPageState();
}

class _DetailPesananPageState extends State<DetailPesananPage> {
  Future<Map<String, dynamic>>? alamatPenjahit;
  int _highlightedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    PenjahitProvider penjahitProvider = Provider.of<PenjahitProvider>(context);

    final productPicture = Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.0),
        child: widget.pesanan.designKustom.length > 0
            ? Image.network(
                widget.pesanan.designKustom[_highlightedImageIndex].foto,
                errorBuilder: (context, exception, stackTrace) {
                  return Center(
                    child: Text(
                      'Foto tidak tersedia',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              )
            : Image.network(
                widget.pesanan.baju.foto,
                errorBuilder: (context, exception, stackTrace) {
                  return Center(
                    child: Text(
                      'Foto tidak tersedia',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
      ),
    );

    final productInfo = Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.pesanan.baju.nama,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: widget.pesanan.baju.jenisKelamin == 'P'
                ? Text(
                    'Perempuan',
                    style: TextStyle(
                      color: ColorConstants.darkGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  )
                : Text(
                    'Laki-laki',
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
              widget.pesanan.baju.deskripsi,
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
        buildFormLabel2(context, 'Jumlah'),
        Container(
          height: 18,
          width: 43,
          color: ColorConstants.grey,
          child: Center(
            child: Text(
              widget.pesanan.detailPesanan.length.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );

    final header = Container(
      decoration: BoxDecoration(
        color: ColorConstants.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: ColorConstants.softGrey,
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

    Container buildDetailUkuran(String label, double value) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.22,
        child: Column(
          children: [
            buildFormLabel3(context, label),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(value.toString()),
            ),
          ],
        ),
      );
    }

    Column buildDataDetail(DetailPesanan detailPesanan) {
      return Column(
        children: [
          SizedBox(height: 11),
          buildFormLabel2(context, 'Nama Lengkap'),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(detailPesanan.namaLengkap),
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
                    buildDetailUkuran('Lengan', detailPesanan.lengan),
                    buildDetailUkuran('Pinggang', detailPesanan.pinggang),
                    buildDetailUkuran('Dada', detailPesanan.dada),
                  ],
                ),
                SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildDetailUkuran('Leher', detailPesanan.leher),
                    buildDetailUkuran(
                        'Tinggi Tubuh', detailPesanan.tinggiTubuh),
                    buildDetailUkuran('Berat Badan', detailPesanan.beratBadan),
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
            child: Text(detailPesanan.instruksiPembuatan),
          ),
          SizedBox(height: 22),
        ],
      );
    }

    final detailPesanan = Container(
      padding: EdgeInsets.symmetric(horizontal: appPadding),
      child: Column(
        children: [
          buildHeadline(context, 'Detail Pesanan'),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.pesanan.detailPesanan.length,
              itemBuilder: (context, i) {
                return buildDataDetail(widget.pesanan.detailPesanan[i]);
              },
            ),
          ),
        ],
      ),
    );

    openwhatsapp() async {
      var whatsapp = "+919144040888";
      var whatsappURI = "https://wa.me/$whatsapp";

      if (await canLaunch(whatsappURI)) {
        await launch(whatsappURI);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    }

    Container buildDataPenjahit(AlamatPenjahit penjahit) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: appPadding),
        child: Column(
          children: [
            buildHeadline(context, 'Data Penjahit'),
            SizedBox(height: 10),
            buildHeadline2(context, penjahit.nama),
            SizedBox(height: 7),
            buildFormLabel(context, 'Alamat'),
            // SizedBox(height: 5),
            buildBodyText3(context, penjahit.alamat),
            SizedBox(height: 7),
            buildFormLabel(context, 'Kecamatan'),
            // SizedBox(height: 5),
            buildBodyText3(context, penjahit.kecamatan),
            SizedBox(height: 7),
            buildFormLabel(context, 'Kota'),
            // SizedBox(height: 5),
            buildBodyText3(context, penjahit.kota),
            SizedBox(height: 7),
            buildFormLabel(context, 'No Telepon'),
            // SizedBox(height: 5),
            buildBodyText3(context, penjahit.noHp),
            SizedBox(height: 2),
            Align(
              alignment: Alignment.centerLeft,
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  width: 80,
                  height: 25,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ColorConstants.greenWhatsapp,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: openwhatsapp,
                  child: Text(
                    'Hubungi',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Container _buildCatalogImage(String foto, int index) {
      return Container(
        margin: EdgeInsets.only(right: 15),
        width: 83,
        child: InkWell(
          onTap: () {
            setState(() {
              _highlightedImageIndex = index;
            });
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              foto,
              fit: BoxFit.cover,
              errorBuilder: (context, exception, stackTrace) {
                return Icon(Icons.error);
              },
            ),
          ),
        ),
      );
    }

    final uploadedImages = Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 23),
          child: Align(
            alignment: Alignment.centerLeft,
            child: buildHeadline2(context, 'Desain Kamu'),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 106,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [Container(child: SizedBox(width: 23))] +
                List.generate(
                  widget.pesanan.designKustom.length,
                  (index) => _buildCatalogImage(
                    widget.pesanan.designKustom[index].foto,
                    index,
                  ),
                ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );

    Column buildAlamat(Alamat alamat) {
      return Column(
        children: [
          alamat.tipe == 1
              ? buildHeadline(context, 'Lokasi Jemput Kain')
              : buildHeadline(context, 'Lokasi Antar Produk'),
          alamat.tipe == 1
              ? buildSubtitle(context,
                  'Bahan kain kamu akan diambil oleh penjahit pada alamat berikut')
              : buildSubtitle(context,
                  'Baju kamu akan diantarkan penjahit pada alamat berikut'),
          SizedBox(height: 10),
          buildFormLabel(context, 'Alamat'),
          SizedBox(height: 5),
          buildBodyText3(context, alamat.alamat),
          SizedBox(height: 10),
          buildFormLabel(context, 'Kecamatan'),
          SizedBox(height: 5),
          buildBodyText3(context, alamat.kecamatan),
          SizedBox(height: 10),
          buildFormLabel(context, 'Kota'),
          SizedBox(height: 5),
          buildBodyText3(context, alamat.kota),
          SizedBox(height: 10),
          buildFormLabel(context, 'Instruksi'),
          SizedBox(height: 5),
          buildBodyText3(context, alamat.instruksi),
        ],
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
      child: Provider(
        lazy: false,
        create: (context) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            alamatPenjahit = penjahitProvider
                .fetchAlamatPenjahitById(widget.pesanan.idPenjahit);
            setState(() {});
          });
        },
        dispose: (context, data) => penjahitProvider.reset(),
        child: Scaffold(
          backgroundColor: ColorConstants.backgroundColor,
          body: FutureBuilder(
            future: alamatPenjahit,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData)
                return SingleChildScrollView(
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(
                      children: [
                        header,
                        SizedBox(height: 15),
                        widget.pesanan.designKustom.length > 1
                            ? uploadedImages
                            : SizedBox.shrink(),
                        SizedBox(height: 15),
                        buildDataPenjahit(snapshot.data['data']),
                        SizedBox(height: 15),
                        detailPesanan,
                        SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: widget.pesanan.lokasiPenjemputan.length == 1
                              ? buildAlamat(widget.pesanan.lokasiPenjemputan[0])
                              : widget.pesanan.lokasiPenjemputan.length == 2
                                  ? Column(
                                      children: [
                                        buildAlamat(widget
                                            .pesanan.lokasiPenjemputan[0]),
                                        SizedBox(height: 30),
                                        buildAlamat(widget
                                            .pesanan.lokasiPenjemputan[1]),
                                      ],
                                    )
                                  : SizedBox.shrink(),
                        ),
                        SizedBox(height: 80),
                      ],
                    ),
                  ),
                );
              else if (snapshot.hasError)
                return Center(
                  child: Text(snapshot.error.toString()),
                  // child: Text('Terjadi kesalahan saat mengambil data'),
                );

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
