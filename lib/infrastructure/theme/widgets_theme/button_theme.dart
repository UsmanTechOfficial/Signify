import 'package:flutter/material.dart';

import '../theme_library.dart';

ButtonThemeData get buttonTheme => ButtonThemeData(
      buttonColor: colorSchemeLight.primary,
      // Use the primary color for buttons
      disabledColor: colorSchemeLight.onSurface.withOpacity(0.38),
      // Use the onSurface color with opacity for disabled buttons
      highlightColor: colorSchemeLight.primaryContainer,
      // Use the primaryContainer color for the highlighted state
      splashColor: colorSchemeLight.secondary,
      // Use the secondary color for the splash effect
      colorScheme: colorSchemeLight,
      // Apply the entire color scheme for buttons
      shape: RoundedRectangleBorder(
// Example shape, adjust as needed
        borderRadius: BorderRadius.circular(4.0),
      ),
// You can add other properties as needed
    );

ButtonThemeData get darkButtonTheme => ButtonThemeData(
      buttonColor: colorSchemeDark.primary,
      // Use the primary color for buttons
      disabledColor: colorSchemeDark.onSurface.withOpacity(0.38),
      // Use the onSurface color with opacity for disabled buttons
      highlightColor: colorSchemeDark.primaryContainer,
      // Use the primaryContainer color for the highlighted state
      splashColor: colorSchemeDark.secondary,
      // Use the secondary color for the splash effect
      colorScheme: colorSchemeDark,
      // Apply the entire color scheme for buttons
      shape: RoundedRectangleBorder(
// Example shape, adjust as needed
        borderRadius: BorderRadius.circular(4.0),
      ),
// You can add other properties as needed
    );
