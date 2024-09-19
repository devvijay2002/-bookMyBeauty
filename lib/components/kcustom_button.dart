import 'package:flutter/material.dart';
import '../constants/colors.dart';

class KCustomButton extends StatelessWidget {
  const KCustomButton(
      {super.key,
        required this.buttonText,
        this.onTap,
        this.gradient,
        this.isOutline = false,
        this.textStyle,
        this.radius,
        this.heightFactor =1/19,
        this.iconChild});
  final String buttonText;
  final double heightFactor;
  final double? radius;
  final TextStyle? textStyle;
  final Widget? iconChild;
  final LinearGradient? gradient;
  final void Function()? onTap;
  final bool isOutline;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isOutline
              ? null
              : gradient == null
              ? kPrimaryColor
              : null,
          borderRadius: BorderRadius.circular(radius ??8),
          border: isOutline ? Border.all(color: kPrimaryColor) : null,
          gradient: gradient ?? kPrimaryGradient,
          boxShadow: isOutline
              ? null
              : [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8.0,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 14),
          child: Center(
            child: iconChild == null
                ? Text(
              buttonText,
              style: textStyle ??
                  const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
            )
             : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonText,
                  style: textStyle ??
                      const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                iconChild!
              ],
            ),
          ),
        ),
      ),
    );
  }
}