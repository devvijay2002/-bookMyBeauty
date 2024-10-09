import 'dart:developer';

import 'package:bookmybeauty/api_service/session_api.dart';
import 'package:bookmybeauty/constants/images.dart';
import 'package:bookmybeauty/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../local_storage/local_storage_keys.dart';
import '../../../shared/responsive_progress_indicator.dart';
import '../../guide_tour/view/guide_view.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  Future<void> initializeRoute() async {
    var userSession = await SessionAPI.generateUserSession();
    log("UserSession $userSession");
    if(userSession.isNotEmpty) {
      await Future.delayed(const Duration(seconds: 2), () {
      Get.off(() =>  GuideTourScreen(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 800),
      );
    });
    }
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              width: Get.width * 0.45,
              height: Get.width* 0.45,
              image: const AssetImage(appLogo),
            ),
            const SizedBox(height: 16),
            LottieBuilder.asset(
              height: Get.height * 0.13,
              loading3,
            )
          ],
        ),
      ),
    );
  }
}
