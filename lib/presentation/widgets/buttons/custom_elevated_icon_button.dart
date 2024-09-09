import 'package:flutter/material.dart';

import '../../../domain/consts/global_var.dart';

class CustomElevatedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? fillColor;
  final Color? borderColor;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? borderWidth;
  final Color? iconColor;
  final double? iconSize;
  final double? elevation;

  const CustomElevatedIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.fillColor,
    this.borderColor,
    this.height,
    this.width,
    this.borderRadius,
    this.borderWidth,
    this.iconColor,
    this.iconSize,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 45,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: fillColor ?? appColorScheme(context).primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
            side: BorderSide(color: borderColor ?? Colors.transparent, width: borderWidth ?? 1.0),
          ),
        ),
        child: Icon(
          icon,
          color: iconColor ?? Colors.white,
          size: iconSize ?? 24.0,
        ),
      ),
    );
  }
}
