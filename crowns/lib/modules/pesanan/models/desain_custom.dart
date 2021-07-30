import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class DesainCustom {
  File foto;
  String deskipsi;

  DesainCustom({required this.foto, required this.deskipsi});

  factory DesainCustom.fromJson(Map<String, dynamic> responseData) {
    // Uint8List fotoTemp = base64.decode(responseData['foto']);
    print('hai');
    var str =
        "iVBORw0KGgoAAAANSUhEUgAAAKYAAADUCAYAAAAWYli9AAAgAElEQVR4XqS9B4xka3oddm7dyrGrOufc05Pzy2Hfexu5XJGmQVq0BFI0DBqSYZGALEOQQdAGKZMyYFmQYCjRoAl6qV2ulrv7NoeX4740b/L0TOecqivHe29d43z/vVXVPf12SavI2XnTXeGve8//hfOd7/u191992bZtG3y4f8s/ADQaDXg8HjQsC9A098fN56nnqz/8b80GGh5At9T7qfdswLZNeR95ntWQVzQ09Ufew9YBHH5/eb+Gsy6+TrPk361nqdc216zZsl75TPWXPNd2fnb0+7mv49fSnO/G9cvnahp0XZc//kCg9d1tYGVjCZbtQcO04fd75TP5nfi3aZkwbQvFYhHbW9swDAPhcBg9Pf3o7OyCV/cDmtm8lBbUZ/GCyPdyrqdcR/6w0UCxVEK5XEY6l5O/q7UqLKsBrweIRsJyXUvVKga7erGzv4+6acDr86NYLuHkyRlkdtPQdR+2dvYQiYZgmCY8moZUqhOnTp+BPxCEzeuqadjf30dHRwfq9TrCwRCK+V1k9zdx5/4i7i2tY6B3EJNj/ejs7sfy8hbW9w5QrFTh9WiwLAu7u3u4dH4Wugbs7e7AKB+gKxFBzWxgaHAM06cuINIRR91oIJHokOvB9W9sbCAWiSKVTMo1Q8AHjcB0b9pRYLYDtIm0hwBMcBB8nwRMGw2toUBCQMJCg8/lT2xNbqimEbQPAx+WAzTeKf7a4vu4m6G1eWT9vJUOUDXw/dSNJjBdsB3//RT4eWN+HjAbDRur64uw4IXpbMZatSo3mu8dDAbh9Xvlxvo8OjxQAJf31nTIujRnnfw6ttr4XKNlmKhWqyiUSyhVy0in08hmM/D7/NC9OvKZvNx8AWK5jKHBfgz298nvMtkcOuMd2N3bR7FShs8fQK1awalTs8iks9C9PmxsbqMjGUelUpE1xWJxXLh0GbruFWBy/dlsFvF4XNYfCUWQz22jmNnFvflFfHx";
    Uint8List fotoTemp = base64.decode(str);

    // final UriData? data = Uri.parse(str).data;
    //
    // Uint8List fotoTemp = data!.contentAsBytes();

    return DesainCustom(
      foto: File.fromRawPath(fotoTemp),
      deskipsi: responseData['deskripsi'],
    );
  }
}
