
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
      backgroundColor: kPrimaryColor,
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
           image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(loginBg), // Use appropriate path
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: Get.height*0.03),
              child: Row(
                children: [
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  },
                      icon: const Icon(Icons.arrow_back_sharp,color: Colors.white,size: 30,))
                ],
              ),
            ),
            SizedBox(
                height: Get.height*0.13,
                child: const Image(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/icons/app_logo_png.png")
                )
            ),
            const SizedBox(height: 10),
            const Text(
              "BookMyBeauty",
              style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold,letterSpacing: 2),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                height: Get.height,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                ),
                child:  const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 30,),
                    Text(
                      'Verify Your OTP',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      'Enter Your 4 Digits OTP',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 30),
                    Expanded(
                      child: SingleChildScrollView(
                          child: OtpForm()
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
