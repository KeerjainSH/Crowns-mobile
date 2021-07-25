import 'dart:async';
import 'dart:convert';

import 'package:crowns/modules/auth/models/user_register.dart';
import 'package:crowns/modules/auth/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:crowns/constants/api_path.dart';
import 'package:crowns/utils/services/user_preferences.dart';

enum AuthStatus {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider with ChangeNotifier {
  AuthStatus _loggedInStatus = AuthStatus.NotLoggedIn;
  AuthStatus _registeredInStatus = AuthStatus.NotRegistered;

  AuthStatus get loggedInStatus => _loggedInStatus;
  AuthStatus get registeredInStatus => _registeredInStatus;

  Future<Map<String, dynamic>> login(String username, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      'username': username,
      'password': password
    };

    _loggedInStatus = AuthStatus.Authenticating;
    notifyListeners();

    Response response = await post(
      Uri.parse(ApiPath.login),
      body: jsonEncode(loginData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var userData = responseData['data'];

      User authUser = User.fromJson(userData);

      UserPreferences().saveUser(authUser);

      _loggedInStatus = AuthStatus.LoggedIn;
      notifyListeners();

      result = {
        'status': true,
        'message': 'Successful',
        'user': authUser,
      };
    } else {
      final Map<String, dynamic> responseData = json.decode(response.body);

      _loggedInStatus = AuthStatus.NotLoggedIn;
      notifyListeners();

      result = {
        'status': false,
        'message': responseData['message'],
      };
    }

    print(result);
    return result;
  }

  Future<Map<String, dynamic>> register(UserRegister userRegister) async {
    var result;

    final Map<String, dynamic> registerData = {
      'username': userRegister.username,
      'password': userRegister.password,
      'email': userRegister.email,
      'nama': userRegister.nama,
      'jenis_kelamin': userRegister.jenis_kelamin,
      'no_hp': userRegister.no_hp,
      'tanggal_lahir': userRegister.tanggal_lahir,
      'kodepos': userRegister.kodepos,
      'kecamatan': userRegister.kecamatan,
      'kota': userRegister.kota,
      'provinsi': userRegister.provinsi,
      'alamat': userRegister.alamat,
    };

    _registeredInStatus = AuthStatus.Registering;
    notifyListeners();

    Response response = await post(
      Uri.parse(ApiPath.register),
      body: jsonEncode(registerData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('helo');

      final Map<String, dynamic> responseData = json.decode(response.body);

      var userData = responseData['data'];

      User authUser = User.fromJson(userData);

      UserPreferences().saveUser(authUser);

      _registeredInStatus = AuthStatus.Registered;
      notifyListeners();

      result = {
        'status': true,
        'message': 'Successful',
        'user': authUser,
      };
    } else {
      final Map<String, dynamic> responseData = json.decode(response.body);

      String data = '';
      int counter = 0;

      for (final val in responseData['data'].values) {
        print(val[0]);

        if (counter > 0) data += '\n';

        data += val[0];

        counter++;
      }

      _registeredInStatus = AuthStatus.NotRegistered;
      notifyListeners();

      result = {
        'status': false,
        'message': json.decode(response.body)['message'],
        'data': data,
      };
    }
    print(result);
    return result;
  }
}
