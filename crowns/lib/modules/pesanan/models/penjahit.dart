class Penjahit {
  int id;
  int id_user;
  String nama;
  String jenis_kelamin;
  String no_hp;
  String tanggal_lahir;
  String nama_rek;
  String no_rekening;
  String bank;
  String kodepos;
  String kecamatan;
  String kota;
  String provinsi;
  String alamat;
  int id_baju;
  int id_penjahit;

  Penjahit({
    required this.id,
    required this.id_user,
    required this.nama,
    required this.jenis_kelamin,
    required this.no_hp,
    required this.tanggal_lahir,
    required this.kodepos,
    required this.kecamatan,
    required this.kota,
    required this.provinsi,
    required this.alamat,
    required this.bank,
    required this.id_baju,
    required this.id_penjahit,
    required this.nama_rek,
    required this.no_rekening,
  });

  factory Penjahit.fromJson(Map<String, dynamic> responseData) {
    return Penjahit(
      id: responseData['id'],
      id_user: responseData['id_user'],
      nama: responseData['nama'],
      jenis_kelamin: responseData['jenis_kelamin'],
      no_hp: responseData['no_hp'],
      tanggal_lahir: responseData['tanggal_lahir'],
      kodepos: responseData['kodepos'],
      kecamatan: responseData['kecamatan'],
      kota: responseData['kota'],
      provinsi: responseData['provinsi'] ?? '',
      alamat: responseData['alamat'],
      bank: responseData['bank'],
      id_baju: responseData['memiliki_table']['id_baju'],
      id_penjahit: responseData['memiliki_table']['id_penjahit'],
      nama_rek: responseData['nama_rek'] ?? '',
      no_rekening: responseData['no_rekening'] ?? '',
    );
  }
}
