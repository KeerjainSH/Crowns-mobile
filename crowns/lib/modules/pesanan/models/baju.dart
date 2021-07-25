class Baju {
  int id;
  int id_kategori;
  String nama;
  String jenis_kelamin;
  String deskripsi;
  String foto;

  Baju({
    required this.id,
    required this.id_kategori,
    required this.nama,
    required this.jenis_kelamin,
    required this.deskripsi,
    required this.foto,
  });

  factory Baju.fromJson(Map<String, dynamic> responseData) {
    return Baju(
      id: responseData['id'],
      id_kategori: responseData['id_kategori'],
      nama: responseData['nama'],
      jenis_kelamin: responseData['jenis_kelamin'],
      deskripsi: responseData['deskripsi'],
      foto: responseData['foto'],
    );
  }
}
