
import 'package:bookmybeauty/constants/images.dart';
import 'package:bookmybeauty/screens/login_screen/widgets/login_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';
import '../widgets/signup_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  List<bool> isSelected = [true, false];

  var loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Color
          Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(loginBg)
              )
            ),
            child: Padding(
              padding:  EdgeInsets.only(top: Get.height*0.06),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                      image: AssetImage(appLogoTransparent)
                  ),
                  SizedBox(height: 10,),
                  Text("BookMyBeauty",style: TextStyle(color: Colors.white,fontSize: 18),)
                ],
              ),
            ),
          ),

          // The scrollable form area
          Positioned.fill(
            top: Get.height * 0.22,
            right: 0,
              left: 0,// Adjust the position as per your design
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(10)
                      )),
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
                      const SizedBox(height: 30),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[

                              isSelected[0]
                                  ? const LoginForm()
                                  : const SignupForm(),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
