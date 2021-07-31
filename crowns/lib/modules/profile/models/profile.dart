class Profile {
  int id;
  int idUser;
  String nama;
  String jenisKelamin;
  String noHp;
  String tanggalLahir;
  String kodepos;
  String kecamatan;
  String kota;
  String provinsi;
  String alamat;
  String username;
  String email;

  Profile({
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
    required this.username,
    required this.email,
  });

  factory Profile.fromJson(Map<String, dynamic> responseData) {
    return Profile(
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
      username: responseData['username'] ?? '',
      email: responseData['email'] ?? '',
    );
  }
}
