import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

enum DesainDialogStatus {
  NotPicked,
  Pickering,
  Picked,
}

class DesainCustomProvider extends ChangeNotifier {
  DesainDialogStatus _desainDialogStatus = DesainDialogStatus.NotPicked;

  File? _image;

  File get image => _image!;
  DesainDialogStatus get desainDialogStatus => _desainDialogStatus;

  final _picker = ImagePicker();

  void resetDialogState() {
    _desainDialogStatus = DesainDialogStatus.NotPicked;
  }

  void pickImageFromGallery() async {
    _desainDialogStatus = DesainDialogStatus.Pickering;
    notifyListeners();

    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _desainDialogStatus = DesainDialogStatus.Picked;
      notifyListeners();
    }
  }
}
