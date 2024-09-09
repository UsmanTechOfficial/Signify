import 'package:flutter/material.dart';

import '../theme.dart';

TextButtonThemeData get textButtonTheme => TextButtonThemeData(
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        // Typically, TextButtons have a transparent background
        foregroundColor: WidgetStateProperty.all(colorSchemeLight.primary),
        // Text color
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return colorSchemeLight.primary.withOpacity(0.2);
            }
            if (states.contains(WidgetState.hovered)) {
              return colorSchemeLight.primary.withOpacity(0.08);
            }
            return null; // Defer to the widget's default.
          },
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 16, // Example size for Body Large
            fontWeight: FontWeight.w500,
          ),
        ),
        padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0)),
      ),
    );

TextButtonThemeData get darkTextButtonTheme => TextButtonThemeData(
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        // Typically, TextButtons have a transparent background
        foregroundColor: WidgetStateProperty.all(colorSchemeDark.primary),
        // Text color
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return colorSchemeDark.primary.withOpacity(0.2);
            }
            if (states.contains(WidgetState.hovered)) {
              return colorSchemeDark.primary.withOpacity(0.08);
            }
            return null; // Defer to the widget's default.
          },
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 16, // Example size for Body Large
            fontWeight: FontWeight.w500,
          ),
        ),
        padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0)),
      ),
    );
