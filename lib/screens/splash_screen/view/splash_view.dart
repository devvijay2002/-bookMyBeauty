import 'package:bookmybeauty/constants/images.dart';
import 'package:bookmybeauty/screens/home_screen/view/home_view.dart';
import 'package:bookmybeauty/screens/saloon_details/view/saloon_details.dart';
import 'package:bookmybeauty/screens/search_saloons/view/seach_saloons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../beauty_services/beauty_services_details_view/view/beauty_services_details.dart';
import '../../nearby_saloons/view/nearby_saloons.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  Future<void> initializeRoute() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Get.off(() => const HomeView(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 800),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    initializeRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(splashBackground2),
          ),
        ),
        child: Center(
          child: Image(
            height: Get.height * 0.45,
            width: Get.width * 0.45,
            image: const AssetImage(appLogo),
          ),
        ),
      ),
    );
  }
}
