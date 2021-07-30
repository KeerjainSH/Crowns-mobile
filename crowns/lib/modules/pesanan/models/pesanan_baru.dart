class PesananBaru {
  int id;
  int idPenjahit;
  int idKonsumen;
  int idBaju;
  int statusPesanan;

  PesananBaru({
    required this.id,
    required this.idPenjahit,
    required this.idKonsumen,
    required this.idBaju,
    required this.statusPesanan,
  });

  factory PesananBaru.fromJson(Map<String, dynamic> responseData) {
    return PesananBaru(
      id: responseData['id'],
      idPenjahit: responseData['id_penjahit'],
      idKonsumen: responseData['id_konsumen'],
      idBaju: responseData['id_baju'],
      statusPesanan: responseData['status_pesanan'],
    );
  }
}
