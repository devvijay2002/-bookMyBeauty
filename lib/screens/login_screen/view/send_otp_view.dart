import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../components/KCustomButton.dart';
import '../../../components/kTextFormField.dart';
import '../../../util/util.dart';
import '../controller/login_controller.dart';

class SendOtpView extends StatefulWidget {
  const SendOtpView({super.key});

  @override
  State<SendOtpView> createState() => _SendOtpViewState();
}

class _SendOtpViewState extends State<SendOtpView> {
  static final loginController = Get.put(LoginController());

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Reference site about giving information"),
          const SizedBox(height: 30),
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
                      prefixIcon: loginController.isPhoneNumber.value ? Icons.phone : Icons.email,
                      onChanged: (s) {
                        if (Util.isPhoneNumber(s.toString())) {
                          loginController.updateIsPhoneNumber(isMobileNo: true);
                        } else {
                          loginController.updateIsPhoneNumber(isMobileNo: false);
                        }
                        log('isPhoneNumber => ${loginController.isPhoneNumber.value}');
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        loginController.isPhoneNumber.value ?FormBuilderValidators.phoneNumber() :FormBuilderValidators.email(),
                      ]),
                      keyboardType: TextInputType.emailAddress,
                    );
                  }
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: KCustomButton(
              onTap: () {
                _formKey.currentState?.saveAndValidate();
                debugPrint(_formKey.currentState?.value.toString());
              },
              radius: 50,
              iconChild: const Icon(Icons.arrow_forward,color: Colors.white),
              buttonText: "Send OTP",
            ),
          )

        ],
      ),
    );
  }
}
