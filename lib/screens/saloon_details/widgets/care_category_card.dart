import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_details.dart';
import '../../../constants/colors.dart';

class CareCategoryCard extends StatelessWidget {
  final String imageUrl;
  final String category;

  const CareCategoryCard({super.key, required this.imageUrl, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.26,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imageUrl),
        ),
      ),
      child: Container(
        color: redAccent,
        child: Center(
          child: Text(
            category,
            style: const TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
