import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final Color backgroundColor;
  final double borderRadius;
  final double padding;

  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = 8.0,
    this.padding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: IconButton(
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
