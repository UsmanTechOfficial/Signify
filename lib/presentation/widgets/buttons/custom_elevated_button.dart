import 'package:flutter/material.dart';

import '../../../domain/consts/global_var.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.fillColor,
    this.borderColor,
    this.height,
    this.width,
    this.fontWeight,
    this.borderRadius,
    this.borderWidth,
    this.alignment,
    this.elevation,
  });

  final Widget child;
  final VoidCallback onPressed;
  final Color? fillColor;
  final Color? borderColor;
  final double? height;
  final double? width;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final double? borderWidth;
  final AlignmentGeometry? alignment;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 45,
      width: width,
      child: ElevatedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            elevation: elevation ?? 0,
            backgroundColor: appColorScheme(context).surface,
            side: BorderSide(
                color: borderColor ?? appColorScheme(context).primary, width: borderWidth ?? 1.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
            ),
          ),
          child: child),
    );
  }
}
