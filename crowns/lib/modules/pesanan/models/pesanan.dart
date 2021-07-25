import 'dart:developer';

import 'package:crowns/modules/pembayaran/models/pembayaran.dart';
import 'package:crowns/modules/pembayaran/models/tawaran.dart';
import 'package:crowns/modules/pesanan/models/alamat.dart';
import 'package:crowns/modules/pesanan/models/baju.dart';
import 'package:crowns/modules/pesanan/models/desain_custom.dart';
import 'package:crowns/modules/pesanan/models/detail_pesanan.dart';
import 'package:flutter/material.dart';

class Pesanan {
  int id;
  int id_penjahit;
  int id_konsumen;
  Baju baju;
  int jumlah;
  String biaya_total;
  int status_pesanan;
  int rating;
  List<DetailPesanan> detail_pesanan;
  // List<DesainCustom> designKustom;
  List<Alamat> lokasi_penjemputan;
  Pembayaran pembayaran;
  Tawaran tawaran;

  Pesanan({
    required this.id,
    required this.id_penjahit,
    required this.id_konsumen,
    required this.baju,
    required this.jumlah,
    required this.biaya_total,
    required this.status_pesanan,
    required this.rating,
    required this.detail_pesanan,
    // required this.designKustom,
    required this.lokasi_penjemputan,
    required this.tawaran,
    required this.pembayaran,
  });

  factory Pesanan.fromJson(Map<String, dynamic> responseData) {
    final bajuData = responseData['baju'];

    Baju baju = Baju.fromJson(bajuData);

    final detailPesananDataList = responseData['detail_pesanan'];
    List<DetailPesanan> detailPesananList = [];

    for (final detailPesananData in detailPesananDataList) {
      var detailPesanan = DetailPesanan.fromJson(detailPesananData);
      detailPesananList.add(detailPesanan);
    }

    // final desainCustomDataList = responseData['designKustom'];
    // List<DesainCustom> desainCustomList = [];
    //
    // for (final desainCustomData in desainCustomDataList) {
    //   var desainCustom = DesainCustom.fromJson(desainCustomData);
    //   desainCustomList.add(desainCustom);
    // }

    final lokasiDataList = responseData['lokasi_penjemputan'];
    List<Alamat> lokasiList = [];

    for (final lokasiData in lokasiDataList) {
      var lokasi = Alamat.fromJson(lokasiData);
      lokasiList.add(lokasi);
    }

    var pembayaran = Pembayaran.fromJson(responseData['pembayaran']);

    return Pesanan(
      id: responseData['id'],
      id_penjahit: responseData['id_penjahit'],
      id_konsumen: responseData['id_konsumen'],
      baju: baju,
      biaya_total: responseData['biaya_total'].toString(),
      // designKustom: desainCustomList,
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
      pembayaran: pembayaran,
    );
  }
}
