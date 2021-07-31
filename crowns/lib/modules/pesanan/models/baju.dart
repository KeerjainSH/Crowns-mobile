class Baju {
  int id;
  int idKategori;
  String nama;
  String jenisKelamin;
  String deskripsi;
  String foto;

  Baju({
    required this.id,
    required this.idKategori,
    required this.nama,
    required this.jenisKelamin,
    required this.deskripsi,
    required this.foto,
  });

  factory Baju.fromJson(Map<String, dynamic> responseData) {
    return Baju(
      id: responseData['id'],
      idKategori: responseData['id_kategori'],
      nama: responseData['nama'] ?? '',
      jenisKelamin: responseData['jenis_kelamin'] ?? '',
      deskripsi: responseData['deskripsi'] ?? '',
      foto: responseData['foto'] ?? '',
    );
  }
}
