import 'package:crowns/constants/request_enums.dart';
import 'package:flutter/cupertino.dart';

class ProfileProvider extends ChangeNotifier {
  RequestStatus _profileStatus = RequestStatus.NotFetched;
}
