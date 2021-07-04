import 'dart:io';

class DesainCustom {
  File foto;
  String deskipsi;

  DesainCustom({required this.foto, required this.deskipsi});

  factory DesainCustom.fromJson(Map<String, dynamic> responseData) {
    return DesainCustom(
      foto: responseData['foto'],
      deskipsi: responseData['foto'],
    );
  }
}
