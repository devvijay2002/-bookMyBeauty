import 'dart:developer';
import 'package:bookmybeauty/screens/login_screen/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../components/kcustom_button.dart';
import '../../../components/kcustom_drop_down.dart';
import '../../../components/ktext_form_field.dart';
import '../../../components/kcustom_outline_button_primary.dart';
import '../../../constants/colors.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool agreeToTerms = false;
  final LoginController loginController = Get.find<LoginController>();

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
                const Text("Name"),
                const SizedBox(height: 14),
                KTextFormField(
                  name: 'name',
                  labelText: 'Enter Name',
                  prefixIcon: Icons.email,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                const Text("Mobile Number"),
                const SizedBox(height: 14),
                KTextFormField(
                  name: 'mobile',
                  labelText: 'Enter Mobile Number',
                  prefixIcon: Icons.wifi_calling_3_rounded,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.phoneNumber(),
                  ]),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                const Text("Gender"),
                const SizedBox(height: 14),
                const CustomFormDropdown(
                  name: 'gender',
                  items: ['Male', 'Female', 'Other'],
                  initialValue: 'Male',
                  hintText: 'Choose your gender',
                  prefixIcon: Icons.person,
                ),
                const SizedBox(height: 20),
                const Text("Password"),
                const SizedBox(height: 14),
                KTextFormField(
                  name: 'password',
                  labelText: 'Enter Password',
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  onChanged: (p0) {
                    loginController.updatedPassword(pass: p0.toString());
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(8),
                  ]),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                const Text("Confirm Password"),
                const SizedBox(height: 14),
                KTextFormField(
                  name: 'confirmPassword',
                  labelText: 'Confirm Password',
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    loginController.confirmPasswordValidator,
                  ]),
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
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
              const Text("I agree to the terms & conditions"),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: KCustomOutlineButton(
                      onPressed: () {},
                      icon: Icons.arrow_forward_outlined,
                      label: 'Skip',
                      radius: 50,
                    )
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: KCustomButton(
                    onTap: () {
                      log("password :${loginController.password.toString()}");
                      log("password1 :${loginController.password.value}");
                      _formKey.currentState?.saveAndValidate();
                      debugPrint(_formKey.currentState?.value.toString());
                    },
                    radius: 50,
                    iconChild: const Icon(Icons.arrow_forward,color: Colors.white,size: 17,),
                    buttonText: "Signup",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


}
