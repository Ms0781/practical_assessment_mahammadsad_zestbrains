import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final String buttonText;
  final Color? backgroundColor;
  final Color? textColor;
  final List<BoxShadow>? boxShadow;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    this.width,
    required this.buttonText,
    this.backgroundColor,
    this.textColor,
    this.boxShadow,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: backgroundColor ?? Color(0x1A100F0F),
          boxShadow: boxShadow
        ),
        child: Center(
          child: Text(
            buttonText.toUpperCase(),
            style: TextStyle(
              fontFamily: 'raleway',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: textColor ?? Color(0xff100F0F),
            ),
          ),
        ),
      ),
    );
  }
}
