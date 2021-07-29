import 'dart:developer';

import 'package:crowns/constants/api_path.dart';
import 'package:crowns/modules/pembayaran/models/pembayaran.dart';
import 'package:crowns/modules/pembayaran/models/tawaran.dart';
import 'package:crowns/modules/pesanan/models/alamat.dart';
import 'package:crowns/modules/pesanan/models/baju.dart';
import 'package:crowns/modules/pesanan/models/desain_custom.dart';
import 'package:crowns/modules/pesanan/models/desain_custom_response.dart';
import 'package:crowns/modules/pesanan/models/detail_pesanan.dart';
import 'package:crowns/modules/pesanan/models/tawaran_response.dart';
import 'package:flutter/material.dart';

class Pesanan {
  int id;
  int id_penjahit;
  int id_konsumen;
  Baju baju;
  int jumlah;
  String biaya_total;
  int status_pesanan;
  double rating;
  List<DetailPesanan> detail_pesanan;
  List<DesainCustomResponse> designKustom;
  List<Alamat> lokasi_penjemputan;
  Pembayaran pembayaran;
  TawaranResponse tawaran;

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
    required this.designKustom,
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

    final desainCustomDataList = responseData['designKustom'];
    List<DesainCustomResponse> desainCustomList = [];

    for (final desainCustomData in desainCustomDataList) {
      var desainCustom = DesainCustomResponse.fromJson(desainCustomData);
      desainCustomList.add(desainCustom);
    }

    final lokasiDataList = responseData['lokasi_penjemputan'];
    List<Alamat> lokasiList = [];

    print('hi');

    for (final lokasiData in lokasiDataList) {
      var lokasi = Alamat.fromJson(lokasiData);
      lokasiList.add(lokasi);
    }

    var pembayaran = Pembayaran.fromJson(responseData['pembayaran']);

    var tawaran;

    print('Hello');

    if (responseData['penawaran'] != null) {
      tawaran = TawaranResponse.fromJson(responseData['penawaran']);
      print('here you gooo');
    } else
      tawaran = TawaranResponse(
          id: 0,
          status_penawaran: 0,
          jumlah_penawaran: '0',
          hari_tawar: DateTime.now());

    print('Hello2');

    return Pesanan(
      id: responseData['id'],
      id_penjahit: responseData['id_penjahit'],
      id_konsumen: responseData['id_konsumen'],
      baju: baju,
      biaya_total: responseData['biaya_total'].toString(),
      designKustom: desainCustomList,
      detail_pesanan: detailPesananList,
      jumlah: responseData['jumlah'],
      lokasi_penjemputan: lokasiList,
      rating: responseData['rating'] == null
          ? 0
          : double.parse(responseData['rating'].toString()),
      status_pesanan: responseData['status_pesanan'] == null
          ? 0
          : int.parse(responseData['status_pesanan']),
      tawaran: tawaran,
      pembayaran: pembayaran,
    );
  }
}
