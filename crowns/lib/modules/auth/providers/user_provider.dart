import 'package:flutter/foundation.dart';
import 'package:crowns/modules/auth/models/user.dart';

class UserProvider with ChangeNotifier {
  User _user = new User(id: 0, token: '');

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
