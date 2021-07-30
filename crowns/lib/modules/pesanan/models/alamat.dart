class Alamat {
  int idPesanan;
  int dijemput;
  int kodePos;
  String kecamatan;
  String kota;
  String provinsi;
  String alamat;
  String waktu;
  String instruksi;
  int tipe;

  Alamat({
    required this.idPesanan,
    required this.dijemput,
    required this.kodePos,
    required this.kecamatan,
    required this.kota,
    required this.provinsi,
    required this.alamat,
    required this.waktu,
    required this.instruksi,
    required this.tipe,
  });

  factory Alamat.fromJson(Map<String, dynamic> responseData) {
    return Alamat(
      dijemput: 1,
      idPesanan: responseData['id_pesanan'],
      waktu: responseData['waktu'],
      kodePos: int.parse(responseData['kode_pos']),
      instruksi: responseData['instruksi'],
      kecamatan: responseData['kecamatan'],
      kota: responseData['kota'],
      provinsi:
          responseData['provinsi'] == null ? '' : responseData['provinsi'],
      alamat: responseData['alamat'],
      tipe: responseData['tipe'] == null ? 0 : responseData['tipe'],
    );
  }
}
