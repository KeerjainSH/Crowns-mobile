class Profile {
  int id;
  int id_user;
  String nama;
  String jenis_kelamin;
  String no_hp;
  String tanggal_lahir;
  String kodepos;
  String kecamatan;
  String kota;
  String provinsi;
  String alamat;
  String username;
  String email;

  Profile({
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
    required this.username,
    required this.email,
  });

  factory Profile.fromJson(Map<String, dynamic> responseData) {
    return Profile(
      id: responseData['id'],
      id_user: responseData['id_user'],
      nama: responseData['nama'],
      jenis_kelamin: responseData['jenis_kelamin'],
      no_hp: responseData['no_hp'],
      tanggal_lahir: responseData['tanggal_lahir'],
      kodepos: responseData['kodepos'],
      kecamatan: responseData['kecamatan'],
      kota: responseData['kota'],
      provinsi:
          responseData['provinsi'] == null ? '' : responseData['provinsi'],
      alamat: responseData['alamat'] == null ? '' : responseData['alamat'],
      username: responseData['username'],
      email: responseData['email'],
    );
  }
}
