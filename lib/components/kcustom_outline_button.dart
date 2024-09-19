import 'package:bookmybeauty/constants/colors.dart';
import 'package:flutter/material.dart';

class KCustomOutlineButtonSecondary extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color borderColor;

  const KCustomOutlineButtonSecondary({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.foregroundColor = kPrimaryColor,
    this.backgroundColor = Colors.white,
    this.borderColor = kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      icon: Icon(icon, color: foregroundColor),
      label: Text(
        label,
        style: TextStyle(color: foregroundColor),
      ),
    );
  }
}
