import 'package:flutter/material.dart';

import '../../../domain/consts/app_consts/pen_tools.dart';
import '../../../domain/consts/global_var.dart';
import '../../../domain/consts/styles.dart';

class CustomPenStroke extends StatelessWidget {
  final int selectedStroke;
  final PenStroke penStroke;

  const CustomPenStroke(
      {super.key, required this.selectedStroke, required this.penStroke});

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppStyle.buttonBorderRadius),
      ),
      color: penStroke.index == selectedStroke
          ? color.primary
          : AppStyle.transparent,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Icon(
          Icons.line_axis,
          color: penStroke.index == selectedStroke
              ? color.surface
              : color.onSurface,
          size: 15 + penStroke.index * 3, // Adjust stroke size based on index
        ),
      ),
    );
  }
}
