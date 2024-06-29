import 'package:image_picker/image_picker.dart';

Future getImageFromYourPhoneCamera() async {
  final phoneCameraImage = await ImagePicker().pickImage(
    source: ImageSource.camera,
  );

  return phoneCameraImage;
}
