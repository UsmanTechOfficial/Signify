import 'package:flutter/material.dart';

import '../../../domain/consts/global_var.dart';

class CustomElevatedTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? fillColor;
  final Color? borderColor;
  final double? height;
  final double? width;
  final double? textSize;
  final FontWeight? fontWeight;
  final AlignmentGeometry? alignment;
  final double? borderRadius;
  final double? borderWidth;

  const CustomElevatedTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fillColor,
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
        style: ElevatedButton.styleFrom(
          backgroundColor: fillColor ?? appColorScheme(context).primary,
          alignment: alignment ?? Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
            side: BorderSide(
                color: borderColor ?? Colors.transparent,
                width: borderWidth ?? 1.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: textSize ?? 16.0,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
