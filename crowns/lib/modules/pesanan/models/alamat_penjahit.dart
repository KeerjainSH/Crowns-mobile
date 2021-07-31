class AlamatPenjahit {
  String nama;
  int kodePos;
  String kecamatan;
  String kota;
  String provinsi;
  String alamat;
  String noHp;

  AlamatPenjahit({
    required this.nama,
    required this.kodePos,
    required this.kecamatan,
    required this.kota,
    required this.provinsi,
    required this.alamat,
    required this.noHp,
  });

  factory AlamatPenjahit.fromJson(Map<String, dynamic> responseData) {
    return AlamatPenjahit(
      nama: responseData['nama'] ?? '',
      kodePos: responseData['kode_pos'] == null
          ? 0
          : int.parse(responseData['kode_pos']),
      kecamatan: responseData['kecamatan'] ?? '',
      kota: responseData['kota'] ?? '',
      provinsi: responseData['provinsi'] ?? '',
      alamat: responseData['alamat'] ?? '',
      noHp: responseData['no_hp'] ?? '',
    );
  }
}
