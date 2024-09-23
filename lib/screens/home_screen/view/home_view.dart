import 'package:bookmybeauty/constants/colors.dart';
import 'package:bookmybeauty/constants/images.dart';
import 'package:bookmybeauty/screens/home_screen/widgets/services_list.dart';
import 'package:bookmybeauty/shared/globle_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/ktoggle_button.dart';
import '../widgets/saloon_type.dart';
import '../widgets/saloons_list.dart';
import '../widgets/trending_services.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GlobalAppBar(
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
            const Text(
              "BookMyBeauty",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.line_weight_outlined,
            color: dimBlackColor,
            size: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.search,
              size: Get.width * 0.07,
              color: dimBlackColor,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.all(5),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: Get.height * 0.16,
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Looking For",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      KToggleButton(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const SaloonTypeWidget(),
                  const TrendingServiceWidget(
                    serviceImages: [
                      girlImage,
                      girlImage,
                      girlImage,
                    ],
                  ),
                  const ServiceListWidget(
                    serviceImages: [
                      girlImage2,
                      girlImage2,
                      girlImage2,
                    ],
                    serviceTitles: [
                      "Hair Cut",
                      "Hair Cut",
                      "Hair Cut",
                    ],
                  ),
                ],
              ),
            ),

             SizedBox(
              height: Get.height/2.2,
              child: const DynamicSizeCarousel(
                images: [
                  saloonImage,
                  saloonImage,
                  saloonImage,
                ],
                titles: [
                  "Hair Cut",
                  "Hair Cut",
                  "Hair Cut",
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
