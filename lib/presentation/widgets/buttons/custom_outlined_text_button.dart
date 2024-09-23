import 'package:flutter/material.dart';

import '../../../domain/consts/global_var.dart';

class CustomOutlinedTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? borderColor;
  final double? height;
  final double? width;
  final double? textSize;
  final FontWeight? fontWeight;
  final AlignmentGeometry? alignment;
  final double? borderRadius;
  final double? borderWidth;

  const CustomOutlinedTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.borderColor,
    this.height,
    this.width,
    this.textSize,
    this.fontWeight,
    this.alignment,
    this.borderRadius,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          elevation: 0,
          backgroundColor: appColorScheme(context).surface,
          alignment: alignment ?? Alignment.center,
          side: BorderSide(
              color: borderColor ?? appColorScheme(context).primary,
              width: borderWidth ?? 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: textSize ?? 16.0,
            fontWeight: fontWeight ?? FontWeight.normal,
            color: textColor ?? appColorScheme(context).primary,
          ),
        ),
      ),
    );
  }
}
