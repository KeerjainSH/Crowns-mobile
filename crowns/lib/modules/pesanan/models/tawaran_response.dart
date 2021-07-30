class TawaranResponse {
  int id;
  String jumlahPenawaran;
  DateTime hariTawar;
  int statusPenawaran;

  TawaranResponse({
    required this.id,
    required this.jumlahPenawaran,
    required this.hariTawar,
    required this.statusPenawaran,
  });

  factory TawaranResponse.fromJson(Map<String, dynamic> responseData) {
    return TawaranResponse(
      id: responseData['id'],
      hariTawar: responseData['hari_tawar'] == null
          ? DateTime.now()
          : DateTime.parse(responseData['hari_tawar']),
      jumlahPenawaran: responseData['jumlah_penawaran'].toString(),
      statusPenawaran: responseData['status_penawaran'] == null
          ? 0
          : int.parse(responseData['status_penawaran']),
    );
  }
}
