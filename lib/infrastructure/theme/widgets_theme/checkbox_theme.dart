import 'package:flutter/material.dart';

import '../theme_library.dart';

CheckboxThemeData get checkboxTheme => CheckboxThemeData(
      fillColor:
          WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return colorSchemeLight
              .primary; // Use the primary color when the checkbox is selected
        }
        return colorSchemeLight.onSurface.withOpacity(
            0.6); // Use the onSurface color with opacity when the checkbox is not selected
      }),
      checkColor: WidgetStateProperty.all<Color>(colorSchemeLight
          .onPrimary), // Use the onPrimary color for the check icon
      overlayColor: WidgetStateProperty.all<Color>(colorSchemeLight
          .secondaryContainer), // Use the secondaryContainer color for the overlay
// You can add other properties as needed
    );

CheckboxThemeData get darkCheckboxTheme => CheckboxThemeData(
      fillColor:
          WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return colorSchemeLight
              .primary; // Use the primary color when the checkbox is selected
        }
        return colorSchemeLight.onSurface.withOpacity(
            0.6); // Use the onSurface color with opacity when the checkbox is not selected
      }),
      checkColor: WidgetStateProperty.all<Color>(colorSchemeLight
          .onPrimary), // Use the onPrimary color for the check icon
      overlayColor: WidgetStateProperty.all<Color>(colorSchemeLight
          .secondaryContainer), // Use the secondaryContainer color for the overlay
// You can add other properties as needed
    );
