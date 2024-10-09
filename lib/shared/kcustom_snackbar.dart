import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KCustomSnackBar {
  final dynamic message;
  final String type;
  final Color? snackBarColor;
  final Color _errorColor = Colors.red;
  final Color _successColor =Colors.green;
  final Color _infoColor =Colors.deepOrange;


  KCustomSnackBar({
    required this.type,
    required this.message,
    this.snackBarColor
  }) {

    show(message, type);
  }

  void show(String message, String type) {
    Get.snackbar(
      '',
      message,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:snackBarColor ?? getMessageColor(type),
      colorText: Colors.white,
      borderRadius: 5,
      titleText: Text(type,style: const TextStyle(color: Colors.white),),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      isDismissible: true,
    );

  }

  Color getMessageColor(String type) {
    Color color = _errorColor;
    switch (type) {
      case 'success':
        color = _successColor;
        break;
      case 'info':
        color = _infoColor;
        break;
      default:
        color = _errorColor;
    }
    return color;
  }
}
