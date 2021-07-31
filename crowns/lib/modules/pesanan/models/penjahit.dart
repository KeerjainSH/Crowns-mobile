class Penjahit {
  int id;
  int idUser;
  String nama;
  String jenisKelamin;
  String noHp;
  String tanggalLahir;
  String namaRek;
  String noRekening;
  String bank;
  String kodepos;
  String kecamatan;
  String kota;
  String provinsi;
  String alamat;
  int idBaju;
  int idPenjahit;
  String rating;

  Penjahit({
    required this.id,
    required this.idUser,
    required this.nama,
    required this.jenisKelamin,
    required this.noHp,
    required this.tanggalLahir,
    required this.kodepos,
    required this.kecamatan,
    required this.kota,
    required this.provinsi,
    required this.alamat,
    required this.bank,
    required this.idBaju,
    required this.idPenjahit,
    required this.namaRek,
    required this.noRekening,
    required this.rating,
  });

  factory Penjahit.fromJson(Map<String, dynamic> responseData) {
    return Penjahit(
      id: responseData['id'],
      idUser: responseData['id_user'],
      nama: responseData['nama'] ?? '',
      jenisKelamin: responseData['jenis_kelamin'] ?? '',
      noHp: responseData['no_hp'] ?? '',
      tanggalLahir: responseData['tanggal_lahir'] ?? '',
      kodepos: responseData['kodepos'] ?? '',
      kecamatan: responseData['kecamatan'] ?? '',
      kota: responseData['kota'] ?? '',
      provinsi: responseData['provinsi'] ?? '',
      alamat: responseData['alamat'] ?? '',
      bank: responseData['bank'] ?? '',
      idBaju: responseData['memiliki_table']['id_baju'],
      idPenjahit: responseData['memiliki_table']['id_penjahit'],
      namaRek: responseData['nama_rek'] ?? '',
      noRekening: responseData['no_rekening'] ?? '',
      rating: responseData['rating'] == null
          ? '0.0'
          : responseData['rating'].toStringAsFixed(1),
    );
  }
}
