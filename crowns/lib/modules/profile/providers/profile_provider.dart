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

  void fetchProfile() async {
    print('fetchProfile');
    _profileStatus = RequestStatus.Fetching;

    final user = await UserPreferences().getUser();
    final userId = user.id;

    print('here');
    Response response = await get(
      Uri.parse(ApiPath.getProfileById(userId)),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData);

      var penjahitData = responseData['data'];

      _profile = Profile.fromJson(penjahitData);

      _profileStatus = RequestStatus.Fetched;
      notifyListeners();
    } else {
      final Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData);
      _profileStatus = RequestStatus.Failed;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> logout() async {
    print('logout');
    var result;
    UserPreferences().removeUser();
    result = {'status': true};
    return result;
  }
}
