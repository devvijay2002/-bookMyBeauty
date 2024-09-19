import 'package:bookmybeauty/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';
import '../widgets/login_form.dart';
import '../widgets/signup_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final LoginController loginController = Get.find<LoginController>();
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            Container(
              height: Get.height*0.22,
              padding: EdgeInsets.only(top: Get.height * 1 / 14),
              child: const Image(
                fit: BoxFit.cover,
                  image: AssetImage("assets/icons/app_logo_png.png")
              )
            ),
            const SizedBox(height: 10),
            const Text(
              "BookMyBeauty",
              style: TextStyle(color: Colors.white, fontSize: 18),
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
                    ToggleButtons(
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      borderColor: Colors.transparent, // No border
                      fillColor: Colors.transparent, // No background fill
                      selectedBorderColor: Colors.transparent,
                      selectedColor: Colors.red, // No border on selection
                      renderBorder: false, // Do not render default border
                      isSelected: isSelected,
                      onPressed: (int index) {
                        setState(() {
                          for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                            isSelected[buttonIndex] = buttonIndex == index;
                          }
                        });
                      },
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: Get.width * 0.15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("LOGIN", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Container(
                                height: 2,
                                width: 50,
                                color: isSelected[0] ? Colors.red : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('SIGNUP', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Container(
                                height: 2,
                                width: 60,
                                color: !isSelected[0] ? Colors.red : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child:    isSelected[0]
                            ? const LoginForm()
                            : const SignupForm(),
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
