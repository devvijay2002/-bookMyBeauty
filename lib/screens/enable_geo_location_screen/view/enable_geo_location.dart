import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../components/kcustom_button.dart';
import '../../../constants/images.dart';

class enableGeoLocation extends StatefulWidget {
  const enableGeoLocation({super.key});

  @override
  State<enableGeoLocation> createState() => _enableGeoLocationState();
}

class _enableGeoLocationState extends State<enableGeoLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              geoLocationImage,
              width: 135,
              height: 120,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: Text(
                "It seems your location is off, Kindly enable your location, then check it again",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 50,
          child: const KCustomButton(buttonText: "Enable Location",
          iconChild: Icon(Icons.arrow_forward,color: Colors.white,),)),
    );

  }
}
