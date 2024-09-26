import 'package:get/get.dart';

class MyAccountController extends GetxController{
  RxString croppedImagePath = ''.obs;

  void updateCroppedImagePath(String path) {
    croppedImagePath.value = path;
  }
}