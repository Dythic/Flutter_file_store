import 'package:image_picker/image_picker.dart';

<<<<<<< HEAD
<<<<<<< HEAD
class PickerProvider extends ChangeNotifier {
=======
class PickerProvider {
>>>>>>> add product provider + modify user provider
=======
class PickerProvider {
>>>>>>> ba6c3d4ff03eed43773dcad4e667457ffb16fb3c
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
