import 'package:crowns/modules/pembayaran/models/pembayaran.dart';
import 'package:crowns/modules/pesanan/models/alamat.dart';
import 'package:crowns/modules/pesanan/models/baju.dart';
import 'package:crowns/modules/pesanan/models/desain_custom_response.dart';
import 'package:crowns/modules/pesanan/models/detail_pesanan.dart';
import 'package:crowns/modules/pesanan/models/tawaran_response.dart';

class Pesanan {
  int id;
  int idPenjahit;
  int idKonsumen;
  Baju baju;
  int jumlah;
  String biayaTotal;
  int statusPesanan;
  double rating;
  List<DetailPesanan> detailPesanan;
  List<DesainCustomResponse> designKustom;
  List<Alamat> lokasiPenjemputan;
  Pembayaran pembayaran;
  TawaranResponse tawaran;
  String createdAt;

  Pesanan({
    required this.id,
    required this.idPenjahit,
    required this.idKonsumen,
    required this.baju,
    required this.jumlah,
    required this.biayaTotal,
    required this.statusPesanan,
    required this.rating,
    required this.detailPesanan,
    required this.designKustom,
    required this.lokasiPenjemputan,
    required this.tawaran,
    required this.pembayaran,
    required this.createdAt,
  });

  factory Pesanan.fromJson(Map<String, dynamic> responseData) {
    final bajuData = responseData['baju'];

    Baju baju;

    if (bajuData != null)
      baju = Baju.fromJson(bajuData);
    else
      baju = new Baju(
        id: 0,
        idKategori: 0,
        nama: '',
        jenisKelamin: '',
        deskripsi: '',
        foto: '',
      );

    final detailPesananDataList = responseData['detail_pesanan'];
    List<DetailPesanan> detailPesananList = [];

    for (final detailPesananData in detailPesananDataList) {
      var detailPesanan = DetailPesanan.fromJson(detailPesananData);
      detailPesananList.add(detailPesanan);
    }

    final desainCustomDataList = responseData['designKustom'];
    List<DesainCustomResponse> desainCustomList = [];

    for (final desainCustomData in desainCustomDataList) {
      var desainCustom = DesainCustomResponse.fromJson(desainCustomData);
      desainCustomList.add(desainCustom);
    }

    final lokasiDataList = responseData['lokasi_penjemputan'];
    List<Alamat> lokasiList = [];

    for (final lokasiData in lokasiDataList) {
      var lokasi = Alamat.fromJson(lokasiData);
      lokasiList.add(lokasi);
    }

    var pembayaran = Pembayaran.fromJson(responseData['pembayaran']);

    var tawaran;

    if (responseData['penawaran'] != null) {
      tawaran = TawaranResponse.fromJson(responseData['penawaran']);
    } else
      tawaran = TawaranResponse(
        id: 0,
        statusPenawaran: 0,
        jumlahPenawaran: '0',
        hariTawar: DateTime.now(),
      );

    return Pesanan(
      id: responseData['id'],
      idPenjahit: responseData['id_penjahit'],
      idKonsumen: responseData['id_konsumen'],
      baju: baju,
      biayaTotal: responseData['biaya_total'] == null
          ? '0'
          : responseData['biaya_total'].toString(),
      designKustom: desainCustomList,
      detailPesanan: detailPesananList,
      jumlah: responseData['jumlah'] ?? 0,
      lokasiPenjemputan: lokasiList,
      rating: responseData['rating'] == null
          ? 0
          : double.parse(responseData['rating'].toString()),
      statusPesanan: responseData['status_pesanan'] == null
          ? 0
          : int.parse(responseData['status_pesanan']),
      tawaran: tawaran,
      pembayaran: pembayaran,
      createdAt: responseData['created_at'] ?? '',
    );
  }
}
