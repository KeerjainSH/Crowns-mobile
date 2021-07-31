class Pembayaran {
  int id;
  int idPesanan;
  String biayaJahit;
  String biayaMaterial;
  String biayaKirim;
  String biayaJemput;
  int statusPembayaran;
  String metodePembayaran;

  Pembayaran({
    required this.id,
    required this.idPesanan,
    required this.biayaJahit,
    required this.biayaMaterial,
    required this.biayaJemput,
    required this.biayaKirim,
    required this.statusPembayaran,
    required this.metodePembayaran,
  });

  factory Pembayaran.fromJson(Map<String, dynamic> responseData) {
    return Pembayaran(
      id: responseData['id'],
      idPesanan: responseData['id_pesanan'],
      biayaJahit: responseData['biaya_jahit'] == null
          ? ''
          : responseData['biaya_jahit'].toString(),
      biayaMaterial: responseData['biaya_material'] == null
          ? ''
          : responseData['biaya_material'].toString(),
      biayaJemput: responseData['biaya_jemput'] == null
          ? ''
          : responseData['biaya_jemput'].toString(),
      biayaKirim: responseData['biaya_kirim'] == null
          ? ''
          : responseData['biaya_kirim'].toString(),
      statusPembayaran: responseData['status_pembayaran'] == null
          ? 0
          : int.parse(responseData['status_pembayaran']),
      metodePembayaran: responseData['metode_pembayaran'] ?? '',
    );
  }
}
