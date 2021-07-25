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

  Future<Map<String, dynamic>> fetchProfile() async {
    var result;
    _profileStatus = RequestStatus.Fetching;

    final user = await UserPreferences().getUser();
    final userId = user.id;

    Response response = await get(
      Uri.parse(ApiPath.getProfileById(userId)),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var penjahitData = responseData['data'];

      _profile = Profile.fromJson(penjahitData);

      _profileStatus = RequestStatus.Fetched;
      notifyListeners();
      result = {
        'status': false,
        'message': responseData['message'],
      };
    } else {
      final Map<String, dynamic> responseData = json.decode(response.body);
      _profileStatus = RequestStatus.Failed;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['message'],
      };
    }

    print(result);
    return result;
  }

  Future<Map<String, dynamic>> logout() async {
    var result;
    UserPreferences().removeUser();

    result = {'status': true};
    print(result);

    return result;
  }
}
