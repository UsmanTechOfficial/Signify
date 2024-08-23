import 'package:flutter/material.dart';

import '../theme_library.dart';

SwitchThemeData get switchTheme => SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return colorSchemeLight
                .secondary; // Thumb color when the switch is on
          }
          return colorSchemeLight.onSurface
              .withOpacity(0.5); // Thumb color when the switch is off
        },
      ),
      trackColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return colorSchemeLight.secondary
                .withOpacity(0.5); // Track color when the switch is on
          }
          return colorSchemeLight.onSurface
              .withOpacity(0.1); // Track color when the switch is off
        },
      ),
      splashRadius: 20, // Splash radius for the ink response
    );

SwitchThemeData get darkSwitchTheme => SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return colorSchemeDark
                .secondary; // Thumb color when the switch is on
          }
          return colorSchemeDark.onSurface
              .withOpacity(0.5); // Thumb color when the switch is off
        },
      ),
      trackColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return colorSchemeDark.secondary
                .withOpacity(0.5); // Track color when the switch is on
          }
          return colorSchemeDark.onSurface
              .withOpacity(0.1); // Track color when the switch is off
        },
      ),
      splashRadius: 20, // Splash radius for the ink response
    );
