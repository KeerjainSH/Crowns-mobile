import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/pesanan/components/form_detail_pesanan_filled.dart';
import 'package:crowns/modules/pesanan/models/alamat.dart';
import 'package:crowns/modules/pesanan/models/pesanan.dart';
import 'package:crowns/modules/pesanan/providers/penjahit_provider.dart';
import 'package:flutter/material.dart';
import 'package:crowns/widgets/texts_widgets.dart';
import 'package:crowns/constants/app_constants.dart';
import 'package:provider/provider.dart';

class DetailPesananLookbackPage extends StatefulWidget {
  Pesanan pesanan;

  DetailPesananLookbackPage({required this.pesanan});

  @override
  _DetailPesananLookbackPageState createState() =>
      _DetailPesananLookbackPageState();
}

class _DetailPesananLookbackPageState extends State<DetailPesananLookbackPage> {
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
            ? FadeInImage(
                image: NetworkImage(
                    widget.pesanan.designKustom[_highlightedImageIndex].foto),
                placeholder: AssetImage(ImageConstants.appLogo),
                fit: BoxFit.cover,
              )
            : FadeInImage(
                image: NetworkImage(
                  widget.pesanan.baju.foto,
                ),
                placeholder: AssetImage(ImageConstants.appLogo),
                fit: BoxFit.cover,
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
            child: widget.pesanan.baju.jenis_kelamin == 'P'
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
              widget.pesanan.detail_pesanan.length.toString(),
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

    final form = Container(
      padding: EdgeInsets.symmetric(horizontal: appPadding),
      child: Column(
        children: [
          buildHeadline(context, 'Detail Pesanan'),
          SizedBox(height: 10),
          Form(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.pesanan.detail_pesanan.length,
                itemBuilder: (context, i) {
                  return FormDetailPesananFilled(
                      detailPesanan: widget.pesanan.detail_pesanan[i]);
                },
              ),
            ),
          ),
        ],
      ),
    );

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

    return Provider(
      lazy: false,
      create: (context) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          // penjahitProvider.fetchAlamatPenjahit(widget.pesanan.id_penjahit);
        });
      },
      dispose: (context, data) => penjahitProvider.reset(),
      child: Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
        body: penjahitProvider.alamatPenjahitStatus == RequestStatus.Fetching
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: [
                    header,
                    SizedBox(height: 15),
                    widget.pesanan.designKustom.length > 1
                        ? uploadedImages
                        : SizedBox.shrink(),
                    SizedBox(height: 15),
                    form,
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: widget.pesanan.lokasi_penjemputan.length == 1
                          ? buildAlamat(widget.pesanan.lokasi_penjemputan[0])
                          : widget.pesanan.lokasi_penjemputan.length == 2
                              ? Column(
                                  children: [
                                    buildAlamat(
                                        widget.pesanan.lokasi_penjemputan[0]),
                                    SizedBox(height: 30),
                                    buildAlamat(
                                        widget.pesanan.lokasi_penjemputan[1]),
                                  ],
                                )
                              : SizedBox.shrink(),
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
      ),
    );
  }
}
