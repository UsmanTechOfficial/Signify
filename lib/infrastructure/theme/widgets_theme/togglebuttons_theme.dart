import 'package:flutter/material.dart';

import '../theme_library.dart';

ToggleButtonsThemeData get toggleButtonsTheme => ToggleButtonsThemeData(
      fillColor: colorSchemeLight.primary,
      selectedColor: colorSchemeLight.onPrimary,
      hoverColor: colorSchemeLight.primaryContainer.withOpacity(0.08),
      focusColor: colorSchemeLight.primaryContainer.withOpacity(0.12),
      splashColor: colorSchemeLight.primaryContainer.withOpacity(0.12),
      textStyle: TextStyle(
        fontSize: 16, // Example size for Body Large
        fontWeight: FontWeight.w500,
        color: colorSchemeLight.onSurface, // Default text color
      ),
      borderColor: colorSchemeLight.outline,
      selectedBorderColor: colorSchemeLight.primary,
      borderRadius: BorderRadius.circular(4.0),
      borderWidth: 2, // Border width
    );

ToggleButtonsThemeData get darkToggleButtonsTheme => ToggleButtonsThemeData(
      fillColor: colorSchemeDark.primary,
      selectedColor: colorSchemeDark.onPrimary,
      hoverColor: colorSchemeDark.primaryContainer.withOpacity(0.08),
      focusColor: colorSchemeDark.primaryContainer.withOpacity(0.12),
      splashColor: colorSchemeDark.primaryContainer.withOpacity(0.12),
      textStyle: TextStyle(
        fontSize: 16, // Example size for Body Large
        fontWeight: FontWeight.w500,
        color: colorSchemeDark.onSurface, // Default text color
      ),
      borderColor: colorSchemeDark.outline,
      selectedBorderColor: colorSchemeDark.primary,
      borderRadius: BorderRadius.circular(4.0),
      borderWidth: 2, // Border width
    );
