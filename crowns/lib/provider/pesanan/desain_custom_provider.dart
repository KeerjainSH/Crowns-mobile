import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

enum DesainCustomStatus {
  NotPicked,
  Pickering,
  Picked,
}

class DesainCustomProvider extends ChangeNotifier {
  DesainCustomStatus _desainDialogStatus = DesainCustomStatus.NotPicked;

  File? _image;

  File get image => _image!;
  DesainCustomStatus get desainDialogStatus => _desainDialogStatus;

  final _picker = ImagePicker();

  void reset() {
    _desainDialogStatus = DesainCustomStatus.NotPicked;
  }

  void pickImage() async {
    _desainDialogStatus = DesainCustomStatus.Pickering;
    notifyListeners();

    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _desainDialogStatus = DesainCustomStatus.Picked;
      notifyListeners();
    }
  }
}
