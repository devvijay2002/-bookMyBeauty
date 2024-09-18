import 'dart:developer';

import 'package:bookmybeauty/components/KCustomButton.dart';
import 'package:bookmybeauty/components/kTextFormField.dart';
import 'package:bookmybeauty/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../controllers/controllers_instance.dart';
import '../../../util/util.dart';
import '../controller/login_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  static final loginController = Get.put(LoginController());

  final _formKey = GlobalKey<FormBuilderState>();
  bool agreeToTerms =false;
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Enter Email I'd or Mobile Number"),
                const SizedBox(height: 14),
                Obx(() {
                  return KTextFormField(
                    name: 'email',
                    labelText: 'Email or Mobile Number',
                    prefixIcon: AppControllers.loginController.isPhoneNumber.value ? Icons.phone : Icons.email,
                    onChanged: (s) {
                      if (Util.isPhoneNumber(s.toString())) {
                        AppControllers.loginController.updateIsPhoneNumber(isMobileNo: true);
                      } else {
                        AppControllers.loginController.updateIsPhoneNumber(isMobileNo: false);
                      }
                      log('isPhoneNumber => ${AppControllers.loginController.isPhoneNumber.value}');
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      AppControllers.loginController.isPhoneNumber.value ?FormBuilderValidators.phoneNumber() :FormBuilderValidators.email(),
                    ]),
                    keyboardType: TextInputType.emailAddress,
                  );
                }),
                const SizedBox(height: 20),
                const Text('Enter Password'),
                const SizedBox(height: 14),
                KTextFormField(
                  name: 'password',
                  labelText: 'Password',
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.password(),
                  ]),
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
           const SizedBox(height: 10,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: agreeToTerms,
                    checkColor: Colors.white,
                    activeColor: dimBlackColor,
                    onChanged: (value) {
                      setState(() {
                        agreeToTerms = value!;
                      });
                    },
                  ),
                  const Text("Remember me"),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Text("Forgot Password?",style: TextStyle(color: blueAccent,fontWeight: FontWeight.bold),),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10.0),
             child: KCustomButton(
               onTap: () {
                 _formKey.currentState?.saveAndValidate();
                 debugPrint(_formKey.currentState?.value.toString());
               },
               iconChild: const Icon(Icons.arrow_forward,color: Colors.white),
                buttonText: "Login",

             ),
           )

        ],
      ),
    );

  }
}
