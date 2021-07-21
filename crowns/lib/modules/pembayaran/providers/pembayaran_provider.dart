import 'dart:convert';
import 'dart:io';

import 'package:crowns/constants/api_path.dart';
import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/pembayaran/models/tawaran.dart';
import 'package:crowns/utils/services/user_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class PembayaranProvider extends ChangeNotifier {
  RequestStatus _detailPembayaranStatus = RequestStatus.NotFetched;
  RequestStatus _tawarStatus = RequestStatus.NotFetched;

  RequestStatus get detailPembayaranStatus => _detailPembayaranStatus;

  void fetchDetailPembayaran(int id) {}

  Future<Map<String, dynamic>> postTawar(Tawaran tawaran, int idPesanan) async {
    _tawarStatus = RequestStatus.Fetching;

    var result;

    final Map<String, dynamic> tawaranData = {
      'id_pesanan': idPesanan,
      'hari_tawar': tawaran.hari_tawar.toString(),
      'jumlah_penawaran': tawaran.jumlah_penawaran,
    };

    var token = await UserPreferences().getToken();

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
      result = {
        'status': true,
        'message': responseData['message'],
      };
    } else {
      _tawarStatus = RequestStatus.Failed;

      final Map<String, dynamic> responseData = json.decode(response.body);

      /// Del soon
      // print(responseData);

      notifyListeners();
      result = {
        'status': true,
        'message': responseData['message'],
      };
    }

    print(result);
    return result;
  }

  Future<Map<String, dynamic>> uploadButki(
    int idPesanan,
    String metode,
    File bukti,
  ) async {
    _tawarStatus = RequestStatus.Fetching;

    var result;

    List<Map<String, dynamic>> buktiBayarList = [];

    List<int> imageBytes = bukti.readAsBytesSync();
    String base64Image = 'data:image/png;base64,' + base64.encode(imageBytes);
    final Map<String, dynamic> buktiBayarData = {
      'foto': base64Image,
    };
    buktiBayarList.add(buktiBayarData);

    final Map<String, dynamic> tawaranData = {
      'id_pesanan': idPesanan,
      'metode_pembayaran': metode,
      'list_bukti': buktiBayarList,
    };

    var token = await UserPreferences().getToken();

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
      result = {
        'status': true,
        'message': responseData['message'],
      };
    } else {
      _tawarStatus = RequestStatus.Failed;

      final Map<String, dynamic> responseData = json.decode(response.body);

      /// Del soon
      // print(responseData);

      notifyListeners();
      result = {
        'status': true,
        'message': responseData['message'],
      };
    }

    print(result);
    return result;
  }
}
