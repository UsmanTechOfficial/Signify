import 'package:flutter/material.dart';

class CustomRoundedIconButton extends StatelessWidget {
  final double? height;
  final double? width;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double iconRotationAngle; // New property for rotating the icon
  final VoidCallback onPressed;

  const CustomRoundedIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.height,
    this.width,
    this.iconSize = 24.0,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.blue,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    this.iconRotationAngle = 0.0, // Default angle is 0 (no rotation)
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: backgroundColor,
      elevation: 0,
      shape: CircleBorder(
        side: BorderSide(color: borderColor, width: borderWidth),
      ),
      height: height ?? 45,
      minWidth: width,
      padding: EdgeInsets.zero,
      child: Transform.rotate(
        angle: iconRotationAngle, // Apply rotation to the icon
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
