import 'package:bookmybeauty/constants/colors.dart';
import 'package:bookmybeauty/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/login_controller.dart';
import '../../widgets/login_form.dart';
import '../../widgets/signup_form.dart';

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
      // Prevent resizing of the background when the keyboard appears
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,

      // Main body content with the background and form
      body: Stack(
        children: [
          Positioned.fromRect(
            rect: Rect.fromCenter(  center: Offset(Get.width/2, Get.height / 10), width: Get.width, height: Get.height/2),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(loginBg), // Your background image path
                ),
              ),
            ),
          ),

          // Foreground content (logo, form, etc.)
          Column(
            children: [
              // Non-scrollable top section (logo and title)
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.03),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.transparent,
                        size: 30,
                      ),
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

              // Scrollable form section
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
                      // Toggle buttons for switching between Login and Signup
                      ToggleButtons(
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        borderColor: Colors.transparent,
                        fillColor: Colors.transparent,
                        selectedBorderColor: Colors.transparent,
                        selectedColor: Colors.red,
                        renderBorder: false,
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

                      // Scrollable form (Login or Signup)
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: isSelected[0]
                                ? const LoginForm()  // Login form content
                                : const SignupForm(), // Signup form content
                          ),
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
