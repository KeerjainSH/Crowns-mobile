class Tawaran {
  int jumlah_penawaran;
  DateTime hari_tawar;

  Tawaran({required this.jumlah_penawaran, required this.hari_tawar});

  factory Tawaran.fromJson(Map<String, dynamic> responseData) {
    return Tawaran(
      hari_tawar: responseData['hari_tawar'],
      jumlah_penawaran: responseData['jumlah_penawaran'],
    );
  }
}
