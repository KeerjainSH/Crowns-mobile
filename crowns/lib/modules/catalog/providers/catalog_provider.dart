import 'dart:convert';

import 'package:crowns/constants/api_path.dart';
import 'package:crowns/modules/catalog/models/catalog.dart';
import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/catalog/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class CatalogProvider extends ChangeNotifier {
  RequestStatus _catalogByCategoryStatus = RequestStatus.NotFetched;
  RequestStatus _catalogAllStatus = RequestStatus.NotFetched;
  RequestStatus _categoryStatus = RequestStatus.NotFetched;

  int _categoryId = 1;
  String _category = '';

  set categoryId(int id) => this._categoryId = id;
  int get categoryId => this._categoryId;

  // List<Catalog> _catalogAllList = [];
  Map<String, dynamic> _catalogAllByCategory = Map<String, dynamic>();
  List<Catalog> _catalogByCategoryList = [];
  List<Category> _categoryList = [];

  RequestStatus get catalogByCategoryStatus => _catalogByCategoryStatus;
  RequestStatus get catalogAllStatus => _catalogAllStatus;

  String get category => _category;

  // List<Catalog> get catalogAllList => _catalogAllList;
  Map<String, dynamic> get catalogAllByCategory => _catalogAllByCategory;
  List<Catalog> get catalogByCategoryList => _catalogByCategoryList;
  List<Category> get categoryList => _categoryList;

  Future<Map<String, dynamic>> fetchCategory() async {
    var result;

    _categoryStatus = RequestStatus.Fetching;
    notifyListeners();

    Response response = await get(
      Uri.parse(ApiPath.category),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      List<dynamic> categoryDataList = responseData['data'];

      for (final categoryData in categoryDataList) {
        Category category = Category.fromJson(categoryData);
        _categoryList.add(category);
      }

      _categoryStatus = RequestStatus.Fetched;
      notifyListeners();

      result = {
        'status': true,
        'message': 'Successful',
      };
    } else {
      _categoryStatus = RequestStatus.Failed;
      notifyListeners();

      result = {
        'status': false,
        'message': json.decode(response.body)['message'],
      };
    }
    print(result);
    return result;
  }

  Future<Map<String, dynamic>> fetchCatalogAll() async {
    var result;
    _catalogAllStatus = RequestStatus.Fetching;
    notifyListeners();

    Response response = await get(
      Uri.parse(ApiPath.catalog),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var catalogDataList = responseData['data'];

      for (final catalogData in catalogDataList) {
        int id_kategori = catalogData['id_kategori'];

        for (final category in _categoryList) {
          if (category.id == id_kategori) {
            if (_catalogAllByCategory[category.nama] == null)
              _catalogAllByCategory[category.nama] = [];

            _catalogAllByCategory[category.nama]
                .add(Catalog.fromJson(catalogData));

            break;
          }
        }
      }

      _catalogAllStatus = RequestStatus.Fetched;
      notifyListeners();
      result = {
        'status': true,
        'message': responseData['message'],
      };
    } else {
      _catalogAllStatus = RequestStatus.Failed;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['message'],
      };
    }
    print(result);
    return result;
  }

  Future<Map<String, dynamic>> fetchCatalogByCategoryId(int id) async {
    var result;
    _catalogByCategoryStatus = RequestStatus.Fetching;
    notifyListeners();

    Response response = await get(
      Uri.parse(ApiPath.getCatalogByCategoryId(id)),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var catalogDataList = responseData['data']['katalog'];

      _category = responseData['data']['kategori'];

      for (final catalogData in catalogDataList) {
        Catalog catalog = Catalog.fromJson(catalogData);
        _catalogByCategoryList.add(catalog);
      }

      _catalogByCategoryStatus = RequestStatus.Fetched;
      notifyListeners();
      result = {
        'status': true,
        'message': responseData['message'],
      };
    } else {
      _catalogByCategoryStatus = RequestStatus.Failed;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['message'],
      };
    }
    print(result);
    return result;
  }

  void resetCatalog() {
    _catalogAllByCategory = Map<String, dynamic>();
  }

  void resetKreasi() {
    _catalogByCategoryList.removeRange(0, _catalogByCategoryList.length);
    _category = '';
  }
}
