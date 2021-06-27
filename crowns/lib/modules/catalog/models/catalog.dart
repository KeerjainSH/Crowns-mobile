import 'dart:typed_data';
import 'dart:convert';

class Catalog {
  int id;
  int idKategori;
  String nama;
  String jenisKelamin;
  String deskripsi;
  Uint8List foto;

  Catalog({
    required this.id,
    required this.idKategori,
    required this.nama,
    required this.jenisKelamin,
    required this.deskripsi,
    required this.foto,
  });

  factory Catalog.fromJson(
    Map<String, dynamic> responseData,
    String base64Image,
  ) {
    // int deficiency = 4 - responseData['foto'].toString().length % 4;
    // if (deficiency > 0) {
    //   responseData['foto'] += 'a' * deficiency;
    // }

    return Catalog(
      id: responseData['id'],
      idKategori: responseData['id_kategori'],
      nama: responseData['nama'],
      jenisKelamin: responseData['jenis_kelamin'],
      deskripsi: responseData['deskripsi'],
      // foto: base64.decode(responseData['foto']),
      foto: base64.decode(base64Image),
    );
  }
}
