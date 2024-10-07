import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../components/kcustom_button.dart';
import '../../../components/kcustom_drop_down.dart';
import '../../../components/form_builder_text_form_field.dart';
import '../../../components/kcustom_outline_button_primary.dart';
import '../../../constants/colors.dart';
import '../../../shared/custom_popups/main_class/custom_popups.dart';
import '../controller/login_controller.dart';


class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormBuilderState>();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => CustomPopups.showImagePickerPopup(context: context),
                    child: Stack(
                      children: [
                        Container(
                          height:Get.height*0.09,
                          width:Get.height*0.09,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: Colors.white,
                            border: Border.all(
                              color: dimBlackColor,
                              width: 2.0,
                            ),
                          ),
                          child:ClipOval(
                              child:Obx(() {
                                if (loginController.croppedImagePath.isNotEmpty) {
                                  return Image.file(File(loginController.croppedImagePath.value));
                                } else {
                                  return const Icon(Icons.person,size: 40,color: dimBlackColor,);
                                }
                              })

                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                                height :30,
                                width :30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: dimBlackColor,
                                      width: 1.0,
                                    )
                                ),
                                child: const Center(child: Icon(Icons.camera_alt,color: Colors.black,size: 17,)))
                        )
                      ],
                    ),
                  ),
                ],
              ),
                const Text("Name"),
                const SizedBox(height: 14),
                CustomTextFormField(
                  name: 'name',
                  labelText: 'Enter Name',
                  prefixIcon: Icons.email,
                  validator: FormBuilderValidators.required(),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                const Text("Mobile Number"),
                const SizedBox(height: 14),
                CustomTextFormField(
                  name: 'mobile',
                  labelText: 'Enter Mobile Number',
                  prefixIcon: Icons.wifi_calling_3_rounded,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.phoneNumber(),
                  ]),
                  keyboardType: TextInputType.phone,
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
                CustomTextFormField(
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
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20),
                const Text("Confirm Password"),
                const SizedBox(height: 14),
                CustomTextFormField(
                  name: 'confirmPassword',
                  labelText: 'Confirm Password',
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    loginController.confirmPasswordValidator,
                  ]),
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Obx(() {
                return Checkbox(
                  value: loginController.agreeToTerms.value,
                  checkColor: Colors.white,
                  activeColor: dimBlackColor,
                  onChanged: (value) {
                    loginController.updateAgreeToTerms(value!);
                  },
                );
              }),
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
                      _formKey.currentState?.saveAndValidate();
                      debugPrint(_formKey.currentState?.value.toString());
                    },
                    radius: 50,
                    iconChild: const Icon(Icons.arrow_forward, color: Colors.white, size: 17,),
                    buttonText: "Signup",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
