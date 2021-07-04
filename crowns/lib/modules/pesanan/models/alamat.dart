class Alamat {
  int id_pesanan;
  int dijemput;
  int kode_pos;
  String kecamatan;
  String kota;
  String alamat;
  String waktu;
  String instruksi;

  Alamat({
    required this.id_pesanan,
    required this.dijemput,
    required this.kode_pos,
    required this.kecamatan,
    required this.kota,
    required this.alamat,
    required this.waktu,
    required this.instruksi,
  });

  factory Alamat.fromJson(Map<String, dynamic> responseData) {
    return Alamat(
      dijemput: 1,
      id_pesanan: responseData['id_pesanan'],
      waktu: responseData['waktu'],
      kode_pos: int.parse(responseData['kode_pos']),
      instruksi: responseData['instruksi'],
      kecamatan: responseData['kecamatan'],
      kota: responseData['kota'],
      alamat: responseData['alamat'],
    );
  }
}
