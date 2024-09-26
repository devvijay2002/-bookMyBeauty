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
    return AspectRatio(
      aspectRatio: 1/1,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(imageUrl),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3),
              width: Get.width,
              color: redAccent,
              child: Center(
                child: Text(
                  category,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: fontSizeSubHeading,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
