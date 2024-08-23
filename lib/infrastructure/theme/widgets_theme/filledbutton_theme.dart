import 'package:flutter/material.dart';

import '../theme_library.dart';

FilledButtonThemeData get filledButtonTheme => FilledButtonThemeData(
        style: ButtonStyle(
      splashFactory: InkRipple.splashFactory,
      backgroundColor: WidgetStateProperty.all(colorSchemeLight.primary),
      foregroundColor: WidgetStateProperty.all(colorSchemeLight.onPrimary),
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return colorSchemeLight.primaryContainer.withOpacity(0.2);
          }
          if (states.contains(WidgetState.hovered)) {
            return colorSchemeLight.primaryContainer.withOpacity(0.08);
          }
          if (states.contains(WidgetState.focused)) {
            return colorSchemeLight.primaryContainer.withOpacity(0.2);
          }
          return null; // Defer to the widget's default.
        },
      ),
      elevation: WidgetStateProperty.resolveWith<double>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return 6.0;
          }
          return 2.0; // Default elevation.
        },
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      textStyle: WidgetStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 16, // Example size for Body Large
          fontWeight: FontWeight.w500,
        ),
      ),
    ));

FilledButtonThemeData get darkFilledButtonTheme => FilledButtonThemeData(
        style: ButtonStyle(
      splashFactory: InkRipple.splashFactory,
      backgroundColor: WidgetStateProperty.all(colorSchemeDark.primary),
      foregroundColor: WidgetStateProperty.all(colorSchemeDark.onPrimary),
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return colorSchemeDark.primaryContainer.withOpacity(0.2);
          }
          if (states.contains(WidgetState.hovered)) {
            return colorSchemeDark.primaryContainer.withOpacity(0.08);
          }
          if (states.contains(WidgetState.focused)) {
            return colorSchemeDark.primaryContainer.withOpacity(0.2);
          }
          return null; // Defer to the widget's default.
        },
      ),
      elevation: WidgetStateProperty.resolveWith<double>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return 6.0;
          }
          return 2.0; // Default elevation.
        },
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      textStyle: WidgetStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 16, // Example size for Body Large
          fontWeight: FontWeight.w500,
        ),
      ),
    ));
