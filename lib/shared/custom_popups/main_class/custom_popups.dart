
import 'package:flutter/cupertino.dart';
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

}
