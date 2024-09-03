import 'package:flutter/material.dart';


import '../../../../domain/consts/global_var.dart';
import '../../../../domain/consts/styles.dart';
import 'pen_tools.dart';

class CustomPenColor extends StatelessWidget {
  final int selectedColor;
  final PenColors penColors;

  const CustomPenColor(
      {super.key, required this.selectedColor, required this.penColors});

  @override
  Widget build(BuildContext context) {
    final colorScheme = appColorScheme(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppStyle.roundedBorder),
        side: BorderSide(
          width: 2.5,
          color: penColors.index == selectedColor
              ? colorScheme.primary
              : colorScheme.surface,
        ),
      ),
      child: CircleAvatar(
        radius: 12,
        backgroundColor: penColors.color,
      ),
    );
  }
}
