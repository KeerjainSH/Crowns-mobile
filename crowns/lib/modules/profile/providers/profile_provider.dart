import 'dart:convert';

import 'package:crowns/constants/api_path.dart';
import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/profile/models/profile.dart';
import 'package:crowns/utils/services/user_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class ProfileProvider extends ChangeNotifier {
  RequestStatus _profileStatus = RequestStatus.NotFetched;
  Profile? _profile;

  Profile get profile => _profile!;
  RequestStatus get profileStatus => _profileStatus;

  void fetchProfile(int id) async {
    print('fetchProfile');
    _profileStatus = RequestStatus.Fetching;
    // notifyListeners();
    print('here');
    Response response = await get(
      Uri.parse(ApiPath.getProfileById(id)),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var penjahitData = responseData['data'];

      _profile = Profile.fromJson(penjahitData);
      _profileStatus = RequestStatus.Fetched;

      notifyListeners();
    } else {
      _profileStatus = RequestStatus.Failed;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> logout() async {
    var result;
    UserPreferences().removeUser();
    result = {'status': true};
    return result;
  }
}