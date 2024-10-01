import 'package:flutter/material.dart';

import '../../../constants/images.dart';

class enableGeoLocation1 extends StatefulWidget {
  const enableGeoLocation1({super.key});

  @override
  State<enableGeoLocation1> createState() => _enableGeoLocation1State();
}

class _enableGeoLocation1State extends State<enableGeoLocation1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFFF2F2F2),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9, // 90% of the screen width
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                alertImage,
                height: 54,
                width: 61,
              ),
              const SizedBox(height: 10),
              const Text(
                "SORRY",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              const Text(
                "We didn't find you near to center.\n Please check your location/internet.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),

    );
  }
}
