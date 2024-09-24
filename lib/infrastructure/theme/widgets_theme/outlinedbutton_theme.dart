import 'package:flutter/material.dart';

import '../theme.dart';

OutlinedButtonThemeData get outlinedButtonTheme => OutlinedButtonThemeData(
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        backgroundColor: WidgetStateProperty.all(colorSchemeLight.surface),
        foregroundColor: WidgetStateProperty.all(colorSchemeLight.onSurface),
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
        side: WidgetStateProperty.all(BorderSide(
          color: colorSchemeLight.primary, // Border color
          width: 1.0, // Border width
        )),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        textStyle: WidgetStateProperty.all(
          TextStyle(
            color: colorSchemeLight.onSurface, // Text color
            fontSize: 16, // Font size
          ),
        ),
        padding:
            WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0)),
      ),
    );

OutlinedButtonThemeData get darkOutlinedButtonTheme => OutlinedButtonThemeData(
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        backgroundColor: WidgetStateProperty.all(colorSchemeDark.surface),
        foregroundColor: WidgetStateProperty.all(colorSchemeDark.onSurface),
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
        side: WidgetStateProperty.all(BorderSide(
          color: colorSchemeDark.primary, // Border color
          width: 1.0, // Border width
        )),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        textStyle: WidgetStateProperty.all(
          TextStyle(
            color: colorSchemeDark.onSurface, // Text color
            fontSize: 16, // Font size
          ),
        ),
        padding:
            WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0)),
      ),
    );
