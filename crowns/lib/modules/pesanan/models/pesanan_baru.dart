class PesananBaru {
  int id;
  int id_penjahit;
  int id_konsumen;
  int id_baju;
  int status_pesanan;

  PesananBaru({
    required this.id,
    required this.id_penjahit,
    required this.id_konsumen,
    required this.id_baju,
    required this.status_pesanan,
  });

  factory PesananBaru.fromJson(Map<String, dynamic> responseData) {
    return PesananBaru(
      id: responseData['id'],
      id_penjahit: responseData['id_penjahit'],
      id_konsumen: responseData['id_konsumen'],
      id_baju: responseData['id_baju'],
      status_pesanan: responseData['status_pesanan'],
    );
  }
}
