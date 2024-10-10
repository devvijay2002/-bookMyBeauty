import 'package:bookmybeauty/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../constants/images.dart';


class ShowLoadingPopup extends StatelessWidget {
  final String? titleText;
  const  ShowLoadingPopup({super.key, this.titleText});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            LottieBuilder.asset(
              width: Get.width*0.23,
              height:Get.width*0.23,
              fit: BoxFit.cover,
              loading2,
            ),
            Text(
              titleText?? "Please Wait...",
              style: TextStyle(
                color: dimBlackColor2,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 20,
              ),
            ),// Loading indicator
          ],
        ),
      ),
    );
  }
}
