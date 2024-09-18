import 'package:bookmybeauty/constants/colors.dart';
import 'package:flutter/material.dart';

class KCustomOutlineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color borderColor;
  final double? radius;

  const KCustomOutlineButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.foregroundColor = kPrimaryColor,
    this.backgroundColor = Colors.white,
    this.borderColor = kPrimaryColor,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ??8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(color: foregroundColor),
          ),
          const SizedBox(width: 8), // Space between text and icon
          Icon(icon, color: foregroundColor,size: 17,),
        ],
      ),
    );
  }
}
