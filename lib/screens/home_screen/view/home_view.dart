import 'dart:developer';

import 'package:bookmybeauty/constants/colors.dart';
import 'package:bookmybeauty/constants/images.dart';
import 'package:bookmybeauty/screens/home_screen/widgets/home_app_bar.dart';
import 'package:bookmybeauty/screens/home_screen/widgets/services_list.dart';
import 'package:bookmybeauty/shared/globle_app_bar.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/kcustom_button.dart';
import '../../../components/ktext_form_field.dart';
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
    log("build method called");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const HomeAppBar(),
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
            const SaloonsListWidget()
          ],
        ),
      ),
    );
  }
}

