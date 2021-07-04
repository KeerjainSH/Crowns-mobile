import 'dart:convert';

import 'package:crowns/constants/api_path.dart';
import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/pembayaran/models/tawaran.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class PembayaranProvider extends ChangeNotifier {
  RequestStatus _detailPembayaranStatus = RequestStatus.NotFetched;
  RequestStatus _tawarStatus = RequestStatus.NotFetched;

  RequestStatus get detailPembayaranStatus => _detailPembayaranStatus;

  void fetchDetailPembayaran(int id) {}

  void postTawar(Tawaran tawaran) async {
    _tawarStatus = RequestStatus.Fetching;

    final Map<String, dynamic> tawaranData = {
      'id_pesanan': 73,
      'hari_tawar': tawaran.hari_tawar.toString(),
      'jumlah_penawaran': tawaran.jumlah_penawaran,
    };

    String token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5IiwianRpIjoiNjEwYjY3MjA1YjIxZjU2NjVkNDhmOGVkNTVhMjQyZDU0MzIyZTg4YzlhYzRhNzUyZWY2ZGIxYjhiNDE1MWNkMzliOTQ5NDg4OTJiOTk1YTYiLCJpYXQiOjE2MjQ5NDI4MzMuNjMxNzE3LCJuYmYiOjE2MjQ5NDI4MzMuNjMxNzI0LCJleHAiOjE2NTY0Nzg4MzMuNjA1NTkxLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.S7lueOFzs1hXCzDaKutAAITsn-RB1aENHjF1zqWuaaa80XvtLAsoh7dPi65vHze3zWz7wkomgouDO8teSRBc32QEXFnrQhIAEyV5B5_s9XSrl24kPgn2gO8z9zM6a8yypI_EKliH0QpsjYCgBFMCZQKOestVHiuwuLO0c8lNzzkPlylmeb3upagRFWynS2DiaazjQjNZ3wW0VvGeTXeBFAfy8bHA6U74QAxiQrXsjBAe4aMJTlk1VQSxM2WSChI6EJUGJfLnO3UoSGdXfaNrkXBxbZtj8VnKgktZPIBCik_O_h_V61U0uDupZkoj32G1609dGpZWq7z9mqThnRXbPWYALA2U2H9XiswlSQ7XJzt3ndg9CLFGg-L7uCSvkgSJbCxgkzN3VXU8orKuJV9tLWmZJgmUPkyzS0IDMAcfnlTLeC0DkvPaYtPYkWzGfiZ82mzVYlMj_Ctc3vqAyxUqVH34ioRomxD0seU2LBb8gLKRAApzm91vjepeaa03zV2F0uMkiAsObsp1cbuJu3jZLjNdIStnHFhIpobqtL9t5wW1r83uKAdJvZ1KBITMZYxqlqp6rUD6oIKLd7eIbrRlidKvpLO3uzqrfvVXAEAQM8_l2zh0EET1_xWukcqM_yVAtvWoSAvTPpEzmaLDEJlEqYDJp4xBoqhyn8gRAytfO3Y';

    Response response = await post(
      Uri.parse(ApiPath.tawar),
      body: json.encode(tawaranData),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      /// Del soon
      print(responseData);

      _tawarStatus = RequestStatus.Fetched;

      notifyListeners();
    } else {
      _tawarStatus = RequestStatus.Failed;

      final Map<String, dynamic> responseData = json.decode(response.body);

      /// Del soon
      // print(responseData);

      notifyListeners();
    }
  }
}
