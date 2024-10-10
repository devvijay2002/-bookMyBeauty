
import 'package:bookmybeauty/shared/kcustom_loading_popup.dart';
import 'package:flutter/material.dart';

import '../image_picker_popups.dart';

class CustomPopups {
  static showImagePickerPopup(
      {required BuildContext context,
        void Function()? onSaveFunction,
        String? text}) {
    return showDialog(
      context: context,
      builder: (context) => ImagePickerPopup(
        onSaveFunction: onSaveFunction,
        text: text,
      ),
    );
  }
  static showCustomLoadingPopup({required BuildContext context, String? text}) {
    return showDialog(
      context: context,
      builder: (context) => ShowLoadingPopup(titleText: text,),
    );
  }
}
