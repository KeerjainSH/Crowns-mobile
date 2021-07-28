class TawaranResponse {
  int id;
  String jumlah_penawaran;
  DateTime hari_tawar;
  int status_penawaran;

  TawaranResponse({
    required this.id,
    required this.jumlah_penawaran,
    required this.hari_tawar,
    required this.status_penawaran,
  });

  factory TawaranResponse.fromJson(Map<String, dynamic> responseData) {
    return TawaranResponse(
      id: responseData['id'],
      hari_tawar: DateTime.parse(responseData['hari_tawar']),
      jumlah_penawaran: responseData['jumlah_penawaran'].toString(),
      status_penawaran: int.parse(responseData['status_penawaran']),
    );
  }
}
