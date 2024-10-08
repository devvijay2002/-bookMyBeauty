import 'package:bookmybeauty/screens/login_screen/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../components/kcustom_button.dart';
import '../../../components/ktext_form_field.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormBuilderState>();
  final LoginController loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Create Password"),
          const SizedBox(height: 13),
          const Text("Reference site about giving information"),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("New Password"),
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
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: KCustomButton(
              onTap: () {
                _formKey.currentState?.saveAndValidate();
                debugPrint(_formKey.currentState?.value.toString());
              },
              iconChild: const Icon(Icons.arrow_forward,color: Colors.white),
              buttonText: "Update",
            ),
          )

        ],
      ),
    );
  }
}
