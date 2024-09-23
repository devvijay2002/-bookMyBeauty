import 'package:flutter/material.dart';
import '../constants/colors.dart';

class KTextFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final bool isPassword;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? filled;
  final bool isBorderSide;
  final Color? fillColor;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;

  const KTextFormField({
    super.key,
    this.labelText,
    this.isPassword = false,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.fillColor,
    this.filled,
    this.isBorderSide=true,
    this.hintText,
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
        fillColor: widget.fillColor ?? Colors.transparent,
        filled: widget.filled ?? false,
        labelText: widget.labelText,
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: widget.isBorderSide ? const BorderSide(
            color: dimBlackColor,
            width: 1.5,
          ) :BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: widget.isBorderSide ? const BorderSide(
            color: dimBlackColor,
            width: 1.5,
          ) :BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: widget.isBorderSide ? const BorderSide(
            color: dimBlackColor,
            width: 1.5,
          ) :BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide:widget.isBorderSide ? const BorderSide(
            color: dimBlackColor,
            width: 1.5,
          ) :BorderSide.none,
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
