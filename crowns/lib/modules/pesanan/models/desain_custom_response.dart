class DesainCustomResponse {
  String foto;
  String deskipsi;

  DesainCustomResponse({required this.foto, required this.deskipsi});

  factory DesainCustomResponse.fromJson(Map<String, dynamic> responseData) {
    return DesainCustomResponse(
      foto: responseData['foto'],
      deskipsi: responseData['deskripsi'],
    );
  }
}
