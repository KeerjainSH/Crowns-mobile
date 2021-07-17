import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class DesainCustom {
  File foto;
  String deskipsi;

  DesainCustom({required this.foto, required this.deskipsi});

  factory DesainCustom.fromJson(
    Map<String, dynamic> responseData,
    String base64Image,
  ) {
    Uint8List fotoTemp = base64.decode(base64Image);
    return DesainCustom(
      foto: File.fromRawPath(fotoTemp),
      deskipsi: responseData['foto'],
    );
  }
}
