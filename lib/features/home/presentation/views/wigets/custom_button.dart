import 'package:books_store/core/resources/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    this.borderRadius,
    required this.text,
    this.onPressed,
  });
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Styles.textstyle16.copyWith(
          color: textColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
