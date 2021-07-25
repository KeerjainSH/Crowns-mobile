import 'dart:convert';

import 'package:crowns/constants/api_path.dart';
import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/pesanan/models/alamat.dart';
import 'package:crowns/utils/services/user_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class AlamatProvider extends ChangeNotifier {
  RequestStatus _alamatStatus = RequestStatus.NotFetched;

  RequestStatus get alamatStatus => _alamatStatus;

  Future<Map<String, dynamic>> updateAlamat(Alamat alamat) async {
    print('start');
    _alamatStatus = RequestStatus.Fetching;

    final Map<String, dynamic> alamatData = {
      'id_pesanan': 22,
      'dijemput': 1,
      'alamat': alamat.alamat,
      'kecamatan': alamat.kecamatan,
      'kota': alamat.kota,
      'kode_pos': alamat.kode_pos,
      'instruksi': alamat.instruksi,
      'waktu': alamat.waktu,
    };

    String token = await UserPreferences().getToken();

    Response response = await post(
      Uri.parse(ApiPath.updateJemput),
      body: json.encode(alamatData),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print('hel yeah');

    var result;

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      /// Del soon
      print(responseData);

      _alamatStatus = RequestStatus.Fetched;

      notifyListeners();

      result = {
        'status': true,
        'message': responseData['message'],
      };
    } else {
      _alamatStatus = RequestStatus.Failed;

      final Map<String, dynamic> responseData = json.decode(response.body);

      /// Del soon
      print(responseData);

      notifyListeners();
      result = {
        'status': true,
        'message': responseData['message'],
      };
    }
    return result;
  }
}
