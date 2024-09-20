
import 'package:bookmybeauty/constants/colors.dart';
import 'package:bookmybeauty/screens/login_screen/widgets/otp_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/images.dart';

class VerifyOtpView extends StatefulWidget {
  const VerifyOtpView({super.key});

  @override
  State<VerifyOtpView> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(loginBg), // Your background image path
                ),
              ),
            ),
          ),
          // Foreground content
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.03),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_sharp, color: Colors.white, size: 30),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.13,
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/icons/app_logo_png.png"),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "BookMyBeauty",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      const Text(
                        'Verify Your OTP',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 13),
                      const Text(
                        'Enter Your 4 Digits OTP',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Expanded(
                        child: SingleChildScrollView(
                          child: OtpForm(), // Your OTP form widget
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
