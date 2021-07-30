class Tawaran {
  int jumlahPenawaran;
  DateTime hariTawar;

  Tawaran({required this.jumlahPenawaran, required this.hariTawar});

  factory Tawaran.fromJson(Map<String, dynamic> responseData) {
    return Tawaran(
      hariTawar: responseData['hari_tawar'],
      jumlahPenawaran: responseData['jumlah_penawaran'],
    );
  }
}
