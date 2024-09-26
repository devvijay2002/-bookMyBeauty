import 'package:bookmybeauty/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../beauty_services/beauty_services_details_view/view/beauty_services_details.dart';
import '../../my_account/view/my_account.dart';



class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {

  Future<void> initializeRoute(BuildContext context)async{
    Future.delayed(const Duration(seconds: 2),(){
      Get.off(() =>  const MyAccountView(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 800),
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
