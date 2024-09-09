import 'package:flutter/material.dart';

import '../theme.dart';

TooltipThemeData get tooltipTheme => TooltipThemeData(
      decoration: BoxDecoration(
        color: colorSchemeLight
            .primaryContainer, // Background color of the tooltip
        borderRadius: BorderRadius.circular(4.0), // Rounded corners
      ),
      textStyle: TextStyle(
        color: colorSchemeLight
            .onPrimaryContainer, // Text color inside the tooltip
        fontSize: 14, // Example size for Body Small
      ),
      padding: const EdgeInsets.all(8.0),
      // Inner padding of the tooltip
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      // Margin around the tooltip
      showDuration: const Duration(seconds: 3),
      // Duration the tooltip will be shown
      waitDuration: const Duration(seconds: 1),
      // Duration to wait before showing the tooltip
      height: 32,
      // Height of the tooltip
      preferBelow: false,
      // Prefer showing the tooltip above the widget if there's space
      verticalOffset: 16, // Vertical offset from the widget
    );

TooltipThemeData get darkTooltipTheme => TooltipThemeData(
      decoration: BoxDecoration(
        color:
            colorSchemeDark.primaryContainer, // Background color of the tooltip
        borderRadius: BorderRadius.circular(4.0), // Rounded corners
      ),
      textStyle: TextStyle(
        color:
            colorSchemeDark.onPrimaryContainer, // Text color inside the tooltip
        fontSize: 14, // Example size for Body Small
      ),
      padding: const EdgeInsets.all(8.0),
      // Inner padding of the tooltip
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      // Margin around the tooltip
      showDuration: const Duration(seconds: 3),
      // Duration the tooltip will be shown
      waitDuration: const Duration(seconds: 1),
      // Duration to wait before showing the tooltip
      height: 32,
      // Height of the tooltip
      preferBelow: false,
      // Prefer showing the tooltip above the widget if there's space
      verticalOffset: 16, // Vertical offset from the widget
    );
