import 'package:bookmybeauty/constants/colors.dart';
import 'package:bookmybeauty/screens/login_screen/widgets/reset_password_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/images.dart';


class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => ResetPasswordViewState();
}

class ResetPasswordViewState extends State<ResetPasswordView> {

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
                    SizedBox(height: 20,),
                    Text(
                      "Create Password",
                      style: TextStyle( fontSize: 19,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Reference site about giving information",
                      style: TextStyle( fontSize: 16,fontWeight: FontWeight.w400,),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ForgotPasswordForm()
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
