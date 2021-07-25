import 'dart:convert';

import 'package:crowns/constants/api_path.dart';
import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/pesanan/models/penjahit.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class PenjahitProvider extends ChangeNotifier {
  RequestStatus _penjahitStatus = RequestStatus.NotFetched;
  List<Penjahit> _penjahitList = [];

  RequestStatus get penjahitStatus => _penjahitStatus;
  List<Penjahit> get penjahitList => _penjahitList;

  Future<Map<String, dynamic>> fetchPenjahitByCatalogId(int id) async {
    var result;

    _penjahitStatus = RequestStatus.Fetching;
    notifyListeners();

    Response response = await get(
      Uri.parse(ApiPath.getPenjahitByCatalogId(id)),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var penjahitDataList = responseData['data']['penjahit'];

      for (final penjahitData in penjahitDataList) {
        Penjahit penjahit = Penjahit.fromJson(penjahitData);
        _penjahitList.add(penjahit);
      }

      _penjahitStatus = RequestStatus.Fetched;
      notifyListeners();
      result = {
        'status': true,
        'message': responseData['message'],
      };
    } else {
      _penjahitStatus = RequestStatus.Failed;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['message'],
      };
    }
    print(result);
    return result;
  }

  void reset() {
    _penjahitList.removeRange(0, _penjahitList.length);
  }
}
