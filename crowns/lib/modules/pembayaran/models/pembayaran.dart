import 'package:flutter/material.dart';

class Pembayaran {
  int id;
  int id_pesanan;
  String biaya_jahit;
  String biaya_material;
  String biaya_kirim;
  String biaya_jemput;
  int status_pembayaran;
  String metode_pembayaran;

  Pembayaran({
    required this.id,
    required this.id_pesanan,
    required this.biaya_jahit,
    required this.biaya_material,
    required this.biaya_jemput,
    required this.biaya_kirim,
    required this.status_pembayaran,
    required this.metode_pembayaran,
  });

  factory Pembayaran.fromJson(Map<String, dynamic> responseData) {
    return Pembayaran(
      // id: 1,
      // id_pesanan: 1,
      // biaya_jahit: 'asdf',
      // biaya_material: 'sdfa',
      // biaya_jemput: 'fdas',
      // biaya_kirim: 'dfasj',
      // status_pembayaran: 2,
      // metode_pembayaran: 'das',
      id: responseData['id'],
      id_pesanan: responseData['id_pesanan'],
      biaya_jahit: responseData['biaya_jahit'].toString(),
      biaya_material: responseData['biaya_material'].toString(),
      biaya_jemput: responseData['biaya_jemput'].toString(),
      biaya_kirim: responseData['biaya_kirim'].toString(),
      status_pembayaran: int.parse(responseData['status_pembayaran']),
      metode_pembayaran: (responseData['metode_pembayaran'] == null)
          ? "Transfer"
          : responseData['metode_pembayaran'],
    );
  }
}
