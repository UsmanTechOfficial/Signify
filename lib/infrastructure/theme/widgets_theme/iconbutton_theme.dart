import 'package:flutter/material.dart';

import '../theme.dart';

IconButtonThemeData get iconButtonTheme => IconButtonThemeData(
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        // backgroundColor:
        //     WidgetStateProperty.all(colorSchemeLight.secondaryContainer),
        foregroundColor:
            WidgetStateProperty.all(colorSchemeLight.onSecondaryContainer),
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return colorSchemeLight.secondary.withOpacity(0.3);
            }
            if (states.contains(WidgetState.hovered)) {
              return colorSchemeLight.secondary.withOpacity(0.08);
            }
            return null; // Defer to the widget's default.
          },
        ),
        shadowColor: WidgetStateProperty.all(colorSchemeLight.shadow),
        // elevation: WidgetStateProperty.all(2),
        padding: WidgetStateProperty.all(const EdgeInsets.all(8)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
// Define other properties if needed
      ),
    );

IconButtonThemeData get darkIconButtonTheme => IconButtonThemeData(
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        // backgroundColor:
        //     WidgetStateProperty.all(colorSchemeDark.secondaryContainer),
        foregroundColor:
            WidgetStateProperty.all(colorSchemeDark.onSecondaryContainer),
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return colorSchemeDark.secondary.withOpacity(0.3);
            }
            if (states.contains(WidgetState.hovered)) {
              return colorSchemeDark.secondary.withOpacity(0.08);
            }
            return null; // Defer to the widget's default.
          },
        ),
        shadowColor: WidgetStateProperty.all(colorSchemeDark.shadow),
        // elevation: WidgetStateProperty.all(2),
        padding: WidgetStateProperty.all(const EdgeInsets.all(8)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
// Define other properties if needed
      ),
    );
