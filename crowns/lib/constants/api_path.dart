class ApiPath {
  // static const String baseUrl = 'http://10.0.2.2:8000/api';
  static const String baseUrl = 'http://crowns.keerjain.com/api';
  static const String login = baseUrl + '/pembeli/login';
  static const String register = baseUrl + '/pembeli/register';

  static const String category = baseUrl + '/kategori';
  static const String catalog = baseUrl + '/katalog';
  static const String createPesanan = baseUrl + '/pesanan/create';
  static const String updateDetail = baseUrl + '/pesanan/updateDetail';
  static const String uploadDesain = baseUrl + '/pesanan/uploadDesignCustom';
  static const String updateJemput = baseUrl + '/pesanan/updateJemput';
  static const String tawar = baseUrl + '/pesanan/ajukanTawar';
  static const String pesananBelumValid =
      baseUrl + '/pesanan/pembayaranBelumValid';
  static const String pesananValid = baseUrl + '/pesanan/pembayaranValid';
  static const String beriRating = baseUrl + '/pesanan/rate';
  static const String updateProfil = baseUrl + '/pembeli/updateProfil';
  static const String uploadBuktiBayar = baseUrl + '/pesanan/bayar';

  static String getCatalogByCategoryId(int id) {
    return baseUrl + '/kategori/' + id.toString() + '/katalog';
  }

  static String getProfileById(int id) {
    return baseUrl + '/pembeli/' + id.toString();
  }

  static String getProfilePenjahitById(int id) {
    return baseUrl + '/penjahit/' + id.toString();
  }

  static String getPenjahitByCatalogId(int id) {
    return baseUrl + '/katalog/' + id.toString() + '/penjahit';
  }

  static String getHistoryPesananbyId(int id) {
    return baseUrl + '/pembeli/' + id.toString() + '/pesanan';
  }
}
