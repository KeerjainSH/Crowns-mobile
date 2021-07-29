class AlamatPenjahit {
  String nama;
  int kode_pos;
  String kecamatan;
  String kota;
  String provinsi;
  String alamat;
  String no_hp;

  AlamatPenjahit({
    required this.nama,
    required this.kode_pos,
    required this.kecamatan,
    required this.kota,
    required this.provinsi,
    required this.alamat,
    required this.no_hp,
  });

  factory AlamatPenjahit.fromJson(Map<String, dynamic> responseData) {
    return AlamatPenjahit(
        nama: responseData['nama'],
        kode_pos: int.parse(responseData['kode_pos']),
        kecamatan: responseData['kecamatan'],
        kota: responseData['kota'],
        provinsi:
            responseData['provinsi'] == null ? '' : responseData['provinsi'],
        alamat: responseData['alamat'],
        no_hp: responseData['no_hp']);
  }
}
