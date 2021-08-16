import 'dart:convert';

import 'package:crowns/constants/api_path.dart';
import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/pesanan/models/alamat.dart';
import 'package:crowns/modules/pesanan/models/pesanan_baru.dart';
import 'package:crowns/utils/services/user_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class AlamatProvider extends ChangeNotifier {
  RequestStatus _alamatStatus = RequestStatus.NotFetched;

  RequestStatus get alamatStatus => _alamatStatus;

  Future<Map<String, dynamic>> updateAlamat(
    List<Alamat> alamatList,
    PesananBaru pesanan,
  ) async {
    _alamatStatus = RequestStatus.Fetching;
    notifyListeners();

    List<Map<String, dynamic>> alamatDataList = [];

    for (final alamat in alamatList) {
      print('alamat tipe' + alamat.tipe.toString());

      final Map<String, dynamic> alamatData = {
        'alamat': alamat.alamat,
        'kecamatan': alamat.kecamatan,
        'kota': alamat.kota,
        'provinsi': alamat.provinsi,
        'kode_pos': alamat.kodePos,
        'instruksi': alamat.instruksi,
        'waktu': alamat.waktu,
        'tipe': alamat.tipe
      };
      alamatDataList.add(alamatData);
    }

    print(alamatDataList);

    String token = await UserPreferences().getToken();

    final Map<String, dynamic> requestData = {
      'id_pesanan': pesanan.id,
      'list_lokasi': alamatDataList
    };

    Response response = await post(
      Uri.parse(ApiPath.updateJemput),
      body: json.encode(requestData),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    var result;

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      _alamatStatus = RequestStatus.Fetched;
      notifyListeners();

      result = {
        'status': true,
        'message': responseData['message'],
      };
    } else {
      _alamatStatus = RequestStatus.Failed;
      notifyListeners();

      final Map<String, dynamic> responseData = json.decode(response.body);
      result = {
        'status': false,
        'message': responseData['message'],
      };
    }
    print(result);
    return result;
  }
}
