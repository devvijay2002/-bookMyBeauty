import 'package:bookmybeauty/components/kcustom_button.dart';
import 'package:bookmybeauty/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../routes/routes.dart';


class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final TextEditingController _otpController = TextEditingController();

  bool agreeToTerms =false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: PinCodeTextField(
            controller: _otpController,
            appContext: context,
            length: 4,
            pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                inactiveColor: dimBlackColor,
                activeColor: dimBlackColor,
                selectedColor: kPrimaryColor,
                fieldHeight: 50,
                fieldWidth: 50,
                borderRadius: BorderRadius.circular(3),
                borderWidth: 1.5,
                activeBorderWidth: 1.5,
                disabledBorderWidth: 1.5,
                inactiveBorderWidth: 1.5,
                errorBorderWidth: 1.5,
                selectedBorderWidth: 1.5
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Resend OTP in 21 Sec",style: TextStyle(color: blueColor),),
            ],
          ),
        ),
        const SizedBox(height: 25,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: KCustomButton(
            onTap: () {
              Navigator.pushNamed(context, Routes.resetPasswordRoute);
            },
            radius: 30,
            iconChild: const Icon(Icons.arrow_forward,color: Colors.white),
            buttonText: "Continue",
          ),
        ),


      ],
    );

  }
}