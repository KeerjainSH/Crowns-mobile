import 'dart:io';

import 'package:crowns/models/desain_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

enum DetailPesananStatus {
  NotChoosen,
  DesainPenjahit,
  DesainSendiri,
  DesainAdded,
  Uploading,
  Uploaded,
}

class DetailPesananProvider extends ChangeNotifier {
  DetailPesananStatus _detailPesananStatus = DetailPesananStatus.NotChoosen;

  List<DesainCustom> _desainCustomList = [];

  List<DesainCustom> get desainCustomList => _desainCustomList;
  DetailPesananStatus get detailPesananStatus => _detailPesananStatus;

  void resetDetailPesanan() {
    _detailPesananStatus = DetailPesananStatus.NotChoosen;
    _desainCustomList.removeRange(0, _desainCustomList.length);
  }

  void addDesain(File image, String description) {
    final desainCustom =
        new DesainCustom(image: image, description: description);
    _desainCustomList.add(desainCustom);
    print(_desainCustomList);
    print(_desainCustomList[0].description + 'fsafhasjdfask');
    _detailPesananStatus = DetailPesananStatus.DesainAdded;
    notifyListeners();
  }

  void setStatus(DetailPesananStatus status) {
    _detailPesananStatus = status;
    notifyListeners();
  }
}
