import 'package:flutter/material.dart';

class KCustomSnackBar2 {
  final BuildContext context;
  final dynamic message;
  final String type;
  final Color _errorColor = Colors.red;
  final Color _successColor = Colors.green.shade500;
  final Color _infoColor = Colors.deepOrange;

  KCustomSnackBar2({
    required this.context,
    required this.type,
    required this.message,
  }) {
    show(context, message, type);
  }

  void show(context, String message, String type) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);


    final AnimationController snackBarAnimationController = AnimationController(
      vsync: scaffoldMessenger,
      duration: const Duration(milliseconds: 300),
    );

    SnackBar snackBar = SnackBar(
      content: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: snackBarAnimationController,
          curve: Curves.easeInOutBack,
        )),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: getMessageColor(type),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      duration: const Duration(seconds: 3),
    );


    scaffoldMessenger.showSnackBar(snackBar);
    snackBarAnimationController.forward();
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