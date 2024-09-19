import 'package:bookmybeauty/constants/images.dart';
import 'package:bookmybeauty/screens/guide_screens/view/guide_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {

  Future<void> initializeRoute(BuildContext context)async{
    Future.delayed(const Duration(seconds: 2),(){
      Get.off(() => GuideTourScreen(),
        transition: Transition.fadeIn, // Choose the desired transition
        duration: const Duration(milliseconds: 500), // Optional: Customize the duration
      );

    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future:initializeRoute(context) ,
        builder: (context,snapshot) {
          return const SizedBox.expand(
            child: Image(
              image: AssetImage(splashBackground),
              fit: BoxFit.cover, // Ensures the image covers the entire screen
            ),
          );
        }
      ),
    );
  }
}
