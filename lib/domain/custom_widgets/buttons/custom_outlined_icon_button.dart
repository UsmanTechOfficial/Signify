import 'package:flutter/material.dart';

import '../../consts/global_var.dart';

class CustomOutlinedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? borderColor;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? borderWidth;
  final Color? iconColor;
  final double? iconSize;

  const CustomOutlinedIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.borderColor,
    this.height,
    this.width,
    this.borderRadius,
    this.borderWidth,
    this.iconColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          elevation: 0,
          backgroundColor: appColorScheme(context).surface,
          side: BorderSide(
              color: borderColor ?? appColorScheme(context).primary,
              width: borderWidth ?? 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          ),
        ),
        child: Icon(
          icon,
          color: iconColor ?? appColorScheme(context).primary,
          size: iconSize ?? 24.0,
        ),
      ),
    );
  }
}
