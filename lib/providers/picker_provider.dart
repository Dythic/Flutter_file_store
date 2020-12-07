import 'package:image_picker/image_picker.dart';

<<<<<<< HEAD
class PickerProvider extends ChangeNotifier {
=======
class PickerProvider {
>>>>>>> add product provider + modify user provider
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
