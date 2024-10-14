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
        child: Image.asset(sideMenuIcon)
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.08,
            width: Get.width * 0.08,
            child: const Image(image: AssetImage(appLogo)),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              "BookMyBeauty",
              style: TextStyle(
                color: kPrimaryColor,
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
            Icons.shopping_cart_outlined,
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
