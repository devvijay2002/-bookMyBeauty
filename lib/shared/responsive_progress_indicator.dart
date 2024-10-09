import 'dart:io';

import 'package:bookmybeauty/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveProgressIndicator extends StatelessWidget {
  const ResponsiveProgressIndicator({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return CircularProgressIndicator(
        color: color ?? dimGreyColor,
      );
    } else {
      return CupertinoActivityIndicator(
        radius: 16,
        color: color ?? dimGreyColor,
      );
    }
  }
}