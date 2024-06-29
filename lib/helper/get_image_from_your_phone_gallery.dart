import 'package:image_picker/image_picker.dart';

Future getImageFromYourPhoneGallery() async {
  final phoneGalleryImage = await ImagePicker().pickImage(
      source: ImageSource
          .gallery); // allow us to access the gallery and take the picture from it
  return phoneGalleryImage;
}
