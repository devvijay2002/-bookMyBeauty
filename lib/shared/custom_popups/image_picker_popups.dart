import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../components/kcustom_button.dart';
import '../../constants/colors.dart';
import '../../screens/login/controller/login_controller.dart';

class ImagePickerPopup extends StatefulWidget {
  const ImagePickerPopup({super.key, this.text, this.onSaveFunction});
  final String? text;
  final void Function()? onSaveFunction;

  @override
  State<ImagePickerPopup> createState() => _ImagePickerPopupState();
}

class _ImagePickerPopupState extends State<ImagePickerPopup> {

  final LoginController loginController = Get.find<LoginController>();
  final ImagePicker _imagePicker = ImagePicker();

  final ImageCropper _imageCropper = ImageCropper();

  Future<String?> uploadImage(
      {required ImageSource source, required BuildContext context}) async {
    var resImage = await _imagePicker.pickImage(source: source);
    if (resImage != null) {
      var croppedImage = await _imageCropper.cropImage(
        sourcePath: resImage.path,
        compressQuality: 70,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Image Cropper',
              toolbarColor: kPrimaryColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Image Cropper',
          ),
        ],
      );
      if (croppedImage != null) {
        log("croppedImagePath ${croppedImage.path}");
        loginController.updateCroppedImagePath(croppedImage.path);
        Navigator.pop(context);
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.text ?? 'Upload Image',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(
                  children: [
                    KCustomButton(
                      onTap: () async {
                        var res = await Permission.camera.request();
                        if (res == PermissionStatus.denied ||
                            res == PermissionStatus.permanentlyDenied ||
                            res == PermissionStatus.restricted) {
                          // negative case
                        } else {
                          // positive case
                          // ignore: use_build_context_synchronously
                          var resImage = await uploadImage(
                              source: ImageSource.camera, context: context);
                          log("resImage $resImage");
                        }
                      },
                      gradient: kPrimaryGradient,
                      buttonText: 'Take a picture',
                      iconChild: const Icon(
                        Icons.camera,
                        color: Colors.white,
                      ),

                    ),
                    const SizedBox(height: 10),
                    KCustomButton(
                      onTap: () async {
                        var res = await Permission.mediaLibrary.request();
                        if (res == PermissionStatus.denied ||
                            res == PermissionStatus.permanentlyDenied ||
                            res == PermissionStatus.restricted) {
                          // negative case
                        } else {
                          // positive case
                          // ignore: use_build_context_synchronously
                          var resImage = await uploadImage(
                              source: ImageSource.gallery, context: context);
                          if (resImage != null) {
                            log("resImageFromGallery $resImage");
                          }
                        }
                      },
                      gradient: kPrimaryGradient,
                      buttonText: 'Upload from Gallery',
                      iconChild: const Icon(
                        Icons.photo_library_rounded,
                        color: Colors.white,
                      ),

                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
