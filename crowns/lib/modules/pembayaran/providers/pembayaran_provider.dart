import 'package:crowns/constants/request_enums.dart';
import 'package:flutter/cupertino.dart';

class PembayaranProvider extends ChangeNotifier {
  RequestStatus _detailPembayaranStatus = RequestStatus.NotFetched;

  RequestStatus get detailPembayaranStatus => _detailPembayaranStatus;

  void fetchDetailPembayaran(int id) {}
}
