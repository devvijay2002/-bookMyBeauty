import 'package:bookmybeauty/constants/images.dart';
import 'package:flutter/material.dart';

import '../../../routes/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {

  Future<void> initializeRoute()async{
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, Routes.guideTourScreen);
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future:initializeRoute() ,
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
