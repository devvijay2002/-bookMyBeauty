import 'package:bookmybeauty/constants/colors.dart';
import 'package:bookmybeauty/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/globle_app_bar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalAppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.09,
            width: Get.width * 0.09,
            child: const Image(image: AssetImage(appLogo)),
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              "BookMyBeauty",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: Get.width / 360 * 16,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      leading: const Icon(
        Icons.line_weight_outlined,
        color: dimBlackColor,
        size: 30,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.search,
            size: Get.width * 0.06,
            color: dimBlackColor,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(7),
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: Colors.white,
            border: Border.all(
              color: dimBlackColor,
              width: 2.0,
            ),
          ),
          child: ClipOval(
            child: Icon(
              Icons.person,
              size: Get.width * 0.04,
              color: dimBlackColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 14.0, left: 8),
          child: Icon(
            Icons.shopping_cart,
            size: Get.width * 0.07,
            color: dimBlackColor,
          ),
        ),
      ],
    );
  }


}
