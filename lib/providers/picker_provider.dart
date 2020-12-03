import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class PickerProvider extends ChangeNotifier {
  final picker = ImagePicker();

  Future<String> getImagePathFromCamera() async {
    return picker
        .getImage(source: ImageSource.camera)
        .then((value) => value != null ? value.path : null);
  }

  Future<String> getImagePathFromGallery() async {
    return picker
        .getImage(source: ImageSource.gallery)
        .then((value) => value != null ? value.path : null);
  }
}
