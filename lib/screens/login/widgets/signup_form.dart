import 'dart:developer';
import 'dart:io';
import 'package:bookmybeauty/routes/routes.dart';
import 'package:bookmybeauty/shared/kcustom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../api_service/auth_api.dart';
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
                  prefixIcon: Icons.person,
                  validator: FormBuilderValidators.required(),
                  keyboardType: TextInputType.text,
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
                    FormBuilderValidators.equalLength(10),
                    FormBuilderValidators.phoneNumber(),
                  ]),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 20),
                const Text("Email"),
                const SizedBox(height: 14),
                CustomTextFormField(
                  name: 'email',
                  labelText: 'Enter Email ID',
                  prefixIcon: Icons.mail,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
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
                  prefixIcon: Icons.person_2_outlined,
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
                    FormBuilderValidators.minLength(6),
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
                  activeColor: dimBlackColor2,
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
                    onTap: ()async{
                      FocusScope.of(context).unfocus();

                      if(_formKey.currentState!.saveAndValidate()) {
                        if(loginController.agreeToTerms.value){
                          CustomPopups.showCustomLoadingPopup(context: context);
                          var value = _formKey.currentState?.value;
                       //   log("value $value");
                          var  data = {
                            "name": value!["name"].toString(),
                            "email":value["email"].toString(),
                            "mobile": value["mobile"].toString(),
                            "gender": value["gender"].toString()=="Male"?"0":value["gender"].toString()=="Female"?"1":"2",
                            "password": value["password"].toString()
                          };
                         var res= await AuthAPI.registerUser(data: data, imagePath: loginController.croppedImagePath.value);
                          Navigator.pop(context);
                          if(res && context.mounted){
                            Navigator.pushNamed(context, Routes.verifyOtpRoute, arguments: {
                              'emailId':value["email"].toString()
                            });
                          }

                        }else{
                          KCustomSnackBar(
                            message: "Please Agree Terms & Conditions",
                              type: 'Error'
                          );
                        }

                      }
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
