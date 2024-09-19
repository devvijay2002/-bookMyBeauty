import 'package:flutter/material.dart';
import '../constants/colors.dart';

class KTextFormField extends StatefulWidget {
  final String labelText;
  final bool isPassword;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;

  const KTextFormField({
    super.key,
    required this.labelText,
    this.isPassword = false,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.keyboardType,
    required this.controller,
  });

  @override
  KTextFormFieldState createState() => KTextFormFieldState();
}

class KTextFormFieldState extends State<KTextFormField> {
  bool _obscureText = true;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        labelText: widget.labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: dimBlackColor,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: dimBlackColor,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: dimBlackColor,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
