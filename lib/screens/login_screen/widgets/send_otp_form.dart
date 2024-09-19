import 'dart:developer';
import 'package:bookmybeauty/screens/login_screen/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../components/kcustom_button.dart';
import '../../../components/form_builder_text_form_field.dart';
import '../../../routes/routes.dart';
import '../../../util/util.dart';


class SendOtpForm extends StatefulWidget {
  const SendOtpForm({super.key});

  @override
  State<SendOtpForm> createState() => _SendOtpFormState();

}

class _SendOtpFormState extends State<SendOtpForm> {
  final LoginController loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Enter Email I'd or Mobile Number"),
                const SizedBox(height: 14),
                Obx(() {
                  return CustomTextFormField(
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
                Navigator.pushNamed(context, Routes.verifyOtpRoute);
        /*        _formKey.currentState?.saveAndValidate();
                debugPrint(_formKey.currentState?.value.toString());*/
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
