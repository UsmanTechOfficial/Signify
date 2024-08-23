import 'package:flutter/material.dart';

import '../theme_library.dart';

SegmentedButtonThemeData get segmentedButtonTheme => SegmentedButtonThemeData(
// Define the style for the buttons
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return colorSchemeLight
                  .primary; // Background color when the button is selected
            }
            return colorSchemeLight
                .primaryContainer; // Background color when the button is not selected
          },
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return colorSchemeLight
                  .onPrimary; // Text color when the button is selected
            }
            return colorSchemeLight
                .onPrimaryContainer; // Text color when the button is not selected
          },
        ),
        overlayColor:
            WidgetStateProperty.all(colorSchemeLight.primary.withOpacity(0.2)),
// Define other properties if needed
      ),
    );

SegmentedButtonThemeData get darkSegmentedButtonTheme =>
    SegmentedButtonThemeData(
// Define the style for the buttons
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return colorSchemeDark
                  .primary; // Background color when the button is selected
            }
            return colorSchemeDark
                .primaryContainer; // Background color when the button is not selected
          },
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return colorSchemeDark
                  .onPrimary; // Text color when the button is selected
            }
            return colorSchemeDark
                .onPrimaryContainer; // Text color when the button is not selected
          },
        ),
        overlayColor:
            WidgetStateProperty.all(colorSchemeDark.primary.withOpacity(0.2)),
// Define other properties if needed
      ),
    );
