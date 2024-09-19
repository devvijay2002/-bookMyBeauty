import 'dart:developer';
import 'package:bookmybeauty/screens/login_screen/widgets/send_otp_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../../components/kcustom_button.dart';
import '../../../../components/form_builder_text_form_field.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/images.dart';
import '../../../../util/util.dart';
import '../../controller/login_controller.dart';

class SendOtpView extends StatefulWidget {
  const SendOtpView({super.key});

  @override
  State<SendOtpView> createState() => _SendOtpViewState();
}

class _SendOtpViewState extends State<SendOtpView> {


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
                    const Text("Reference site about giving information"),
                    const SizedBox(height: 30),
                    Expanded(
                      child: SingleChildScrollView(
                          child: SendOtpForm()
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
