import 'package:bookmybeauty/constants/colors.dart';
import 'package:bookmybeauty/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/globle_app_bar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> homeScaffoldKey;
  const HomeAppBar({super.key,required this.homeScaffoldKey});

  @override
  Widget build(BuildContext context) {
    return GlobalAppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
       homeScaffoldKey.currentState!.openDrawer();
        },
        child: Icon(
        Icons.line_weight_outlined,
        color: dimBlackColor2, // Define dim_black_color separately
        size: 30,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.09,
            width: Get.width * 0.09,
            child: const Image(image: AssetImage(appLogo)), // Define app_logo separately
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              "BookMyBeauty",
              style: TextStyle(
                color: kPrimaryColor, // Define k_primary_color separately
                fontSize: Get.width / 360 * 15,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.search,
            size: Get.width * 0.06,
            color: dimBlackColor2,
          ),
        ),
         const Icon(Icons.notifications,color: kPrimaryColor,),
        Padding(
          padding: const EdgeInsets.only(right: 14.0, left: 8),
          child: Icon(
            Icons.shopping_cart,
            size: Get.width * 0.07,
            color: dimBlackColor2,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
