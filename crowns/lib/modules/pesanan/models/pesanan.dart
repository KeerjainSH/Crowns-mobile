import 'package:crowns/modules/pembayaran/models/tawaran.dart';
import 'package:crowns/modules/pesanan/models/alamat.dart';
import 'package:crowns/modules/pesanan/models/desain_custom.dart';
import 'package:crowns/modules/pesanan/models/detail_pesanan.dart';
import 'package:flutter/material.dart';

class Pesanan {
  int id;
  int id_penjahit;
  int id_konsumen;
  int id_baju;
  int jumlah;
  String biaya_total;
  int status_pesanan;
  int rating;
  List<DetailPesanan> detail_pesanan;
  List<DesainCustom> designKustom;
  List<Alamat> lokasi_penjemputan;

  /// not implemented class
  // Pembayaran pembayaran;
  Tawaran tawaran;

  Pesanan({
    required this.id,
    required this.id_penjahit,
    required this.id_konsumen,
    required this.id_baju,
    required this.jumlah,
    required this.biaya_total,
    required this.status_pesanan,
    required this.rating,
    required this.detail_pesanan,
    required this.designKustom,
    required this.lokasi_penjemputan,
    required this.tawaran,
  });

  factory Pesanan.fromJson(Map<String, dynamic> responseData) {
    final detailPesananDataList = responseData['detail_pesanan'];
    List<DetailPesanan> detailPesananList = [];

    for (final detailPesananData in detailPesananDataList) {
      var detailPesanan = DetailPesanan.fromJson(detailPesananData);
      detailPesananList.add(detailPesanan);
    }

    final desainCustomDataList = responseData['designKustom'];
    List<DesainCustom> desainCustomList = [];

    for (final desainCustomData in desainCustomDataList) {
      var desainCustom = DesainCustom.fromJson(desainCustomData);
      desainCustomList.add(desainCustom);
    }

    final lokasiDataList = responseData['lokasi_penjemputan'];
    List<Alamat> lokasiList = [];

    for (final lokasiData in lokasiDataList) {
      var lokasi = Alamat.fromJson(lokasiData);
      lokasiList.add(lokasi);
    }

    return Pesanan(
      id: responseData['id'],
      id_penjahit: responseData['id_penjahit'],
      id_konsumen: responseData['id_konsumen'],
      id_baju: responseData['id_baju'],
      biaya_total: responseData['biaya_total'] ?? '',
      designKustom: desainCustomList,
      detail_pesanan: detailPesananList,
      jumlah: responseData['jumlah'],
      lokasi_penjemputan: lokasiList,
      rating: responseData['rating'] == null
          ? 0
          : int.parse(responseData['rating']),
      status_pesanan: responseData['status_pesanan'] == null
          ? 0
          : int.parse(responseData['status_pesanan']),
      tawaran: responseData['tawaran'] == null
          ? Tawaran(jumlah_penawaran: 0, hari_tawar: DateTime.now())
          : Tawaran.fromJson(
              responseData['tawaran'],
            ),
    );
  }
}
