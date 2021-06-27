import 'dart:convert';
import 'dart:typed_data';

import 'package:crowns/constants/api_path.dart';
import 'package:crowns/modules/catalog/models/catalog.dart';
import 'package:crowns/constants/app_constants.dart';
import 'package:crowns/constants/request_enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

class CatalogProvider extends ChangeNotifier {
  RequestStatus _catalogByCategoryStatus = RequestStatus.NotFetched;
  RequestStatus _catalogAllStatus = RequestStatus.NotFetched;

  List<Catalog> _catalogAllList = [];
  List<Catalog> _catalogByCategoryList = [];

  RequestStatus get catalogByIdStatus => _catalogByCategoryStatus;
  RequestStatus get catalogAllStatus => _catalogAllStatus;

  List<Catalog> get catalogAllList => _catalogAllList;
  List<Catalog> get catalogByCategoryList => _catalogByCategoryList;

  void fetchCatalogAll() async {
    _catalogAllStatus = RequestStatus.Fetching;
    // notifyListeners();

    Response response = await get(
      Uri.parse(ApiPath.catalog),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var catalogDataList = responseData['data'];

      /// For dummy image
      /// Commnet soon
      ByteData bytes = await rootBundle.load(ImageConstants.pestaProduct1);
      var buffer = bytes.buffer;
      var base64Image = base64.encode(Uint8List.view(buffer));

      for (final catalogData in catalogDataList) {
        Catalog catalog = Catalog.fromJson(catalogData, base64Image);
        _catalogAllList.add(catalog);
      }

      _catalogAllStatus = RequestStatus.Fetched;
      notifyListeners();
    } else {
      _catalogAllStatus = RequestStatus.Failed;
    }
  }

  void fetchCatalogByCategoryId(int id) async {
    _catalogByCategoryStatus = RequestStatus.Fetching;
    // notifyListeners();

    Response response = await get(
      Uri.parse(ApiPath.getCatalogByCategoryId(id)),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var catalogDataList = responseData['data']['katalog'];

      /// For dummy image
      /// Commnet soon
      ByteData bytes = await rootBundle.load(ImageConstants.pestaProduct1);
      var buffer = bytes.buffer;
      var base64Image = base64.encode(Uint8List.view(buffer));

      for (final catalogData in catalogDataList) {
        Catalog catalog = Catalog.fromJson(catalogData, base64Image);
        _catalogByCategoryList.add(catalog);
      }

      _catalogAllStatus = RequestStatus.Fetched;
      notifyListeners();
    } else {
      _catalogAllStatus = RequestStatus.Failed;
    }
  }

  void resetKreasi() {
    _catalogByCategoryList.removeRange(0, _catalogByCategoryList.length);
  }
}
