import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString password = ''.obs;
  RxBool isPhoneNumber =false.obs;

  void updatedPassword({required String pass}) {
    password.value = pass;
  }
  void updateIsPhoneNumber({required bool isMobileNo}) {
    isPhoneNumber.value = isMobileNo;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password.value) {
      return 'Passwords do not match';
    }
    return null; // Valid
  }


}
