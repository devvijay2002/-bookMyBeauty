import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../constants/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String name;
  final String labelText;
  final bool isPassword;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key,
    required this.name,
    required this.labelText,
    this.isPassword = false,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.keyboardType,
  });

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        labelText: widget.labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide:  BorderSide(
            color: dimBlackColor,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide:  BorderSide(
            color: dimBlackColor,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide:  BorderSide(
            color:dimBlackColor,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide:  BorderSide(
            color: dimBlackColor,
            width: 1.5,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        errorStyle: const TextStyle(
          fontSize: 12.0,
          color: kPrimaryColor,
        ),
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: kPrimaryColor)
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
             icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: dimBlackColor,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : (widget.suffixIcon != null
            ? Icon(widget.suffixIcon, color: dimBlackColor)
            : null),
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
    );
  }
}
