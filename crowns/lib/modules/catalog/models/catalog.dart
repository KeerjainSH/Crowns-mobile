class Catalog {
  int id;
  int idKategori;
  String nama;
  String jenisKelamin;
  String deskripsi;
  String foto;

  Catalog({
    required this.id,
    required this.idKategori,
    required this.nama,
    required this.jenisKelamin,
    required this.deskripsi,
    required this.foto,
  });

  factory Catalog.fromJson(Map<String, dynamic> responseData) {
    return Catalog(
      id: responseData['id'],
      idKategori: responseData['id_kategori'],
      nama: responseData['nama'] ?? '',
      jenisKelamin: responseData['jenis_kelamin'] ?? '',
      deskripsi: responseData['deskripsi'] ?? '',
      foto: responseData['foto'] ?? '',
    );
  }
}
