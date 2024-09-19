import 'package:bookmybeauty/constants/colors.dart';
import 'package:bookmybeauty/screens/login_screen/widgets/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => ForgotPasswordViewState();
}

class ForgotPasswordViewState extends State<ForgotPasswordView> {
  final LoginController loginController = Get.find<LoginController>();
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
            color: kPrimaryColor
          /* image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(loginBg), // Use appropriate path
          ),*/
        ),
        child: Column(
          children: [
            Container(
                height: Get.height*0.2,
                padding: EdgeInsets.only(top: Get.height * 1 / 14),
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
