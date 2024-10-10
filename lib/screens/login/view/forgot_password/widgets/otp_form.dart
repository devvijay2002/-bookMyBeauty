import 'package:bookmybeauty/api_service/auth_api.dart';
import 'package:bookmybeauty/shared/custom_popups/main_class/custom_popups.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../components/kcustom_button.dart';
import '../../../../../constants/colors.dart';


class OtpForm extends StatefulWidget {
  final String emailId;
  const OtpForm({super.key,required this.emailId});

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
                activeColor: secondaryColor,
                selectedColor: blueAccent,
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
            onTap: ()async{
           // Navigator.pushNamed(context, Routes.resetPasswordRoute);
            if(_otpController.text.isNotEmpty){
              CustomPopups.showCustomLoadingPopup(context: context);
              var data ={
                "email": widget.emailId,
                "otp":_otpController.text.trim().toString()
              };
              await AuthAPI.verifyOTP(data: data);
              Navigator.pop(context);
            }
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