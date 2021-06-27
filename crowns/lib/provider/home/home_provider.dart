import 'dart:convert';
import 'dart:async';

import 'package:crowns/config/api.dart';
import 'package:crowns/models/home/category.dart';
import 'package:crowns/utils/status.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class HomeProvider extends ChangeNotifier {
  RequestStatus _categoryStatus = RequestStatus.NotFetched;

  List<Category> _categoryList = [];

  List<Category> get categoryList => _categoryList;

  Future<Map<String, dynamic>> fetchCategory() async {
    var result;

    _categoryStatus = RequestStatus.Fetching;
    // notifyListeners();

    Response response = await get(
      Uri.parse(AppUrl.category),
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
        'category': _categoryList,
      };
    } else {
      _categoryStatus = RequestStatus.Failed;
      // notifyListeners();

      result = {
        'status': false,
        'message': json.decode(response.body)['message'],
      };
    }
    return result;
  }
}
