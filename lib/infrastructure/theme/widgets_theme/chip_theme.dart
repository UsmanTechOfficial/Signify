import 'package:flutter/material.dart';

import '../theme_library.dart';

ChipThemeData get chipThemeData => ChipThemeData(
      backgroundColor: colorSchemeLight.primaryContainer,
      // Use the primaryContainer color for chip backgrounds
      deleteIconColor: colorSchemeLight.error,
      // Color for delete icons in chips
      disabledColor: colorSchemeLight.onSurface.withOpacity(0.38),
      // Color for disabled chips
      selectedColor: colorSchemeLight.primary,
      // Color when the chip is selected
      secondarySelectedColor: colorSchemeLight.secondary,
      // Color when the chip is selected, for secondary style
      labelStyle: TextStyle(color: colorSchemeLight.onPrimaryContainer),
      // Text style for chip labels
      secondaryLabelStyle: TextStyle(color: colorSchemeLight.onSecondary),
      // Text style for secondary chip labels
      brightness: Brightness.light,
      // Theme brightness, use Brightness.dark for dark mode
      padding: const EdgeInsets.all(4.0),
      // Padding inside the chip
      shape: RoundedRectangleBorder(
// Shape of the chip
        borderRadius: BorderRadius.circular(8.0),
      ),
// You can add other properties as needed
    );

ChipThemeData get darkChipThemeData => ChipThemeData(
      backgroundColor: colorSchemeDark.primaryContainer,
      // Use the primaryContainer color for chip backgrounds
      deleteIconColor: colorSchemeDark.error,
      // Color for delete icons in chips
      disabledColor: colorSchemeDark.onSurface.withOpacity(0.38),
      // Color for disabled chips
      selectedColor: colorSchemeDark.primary,
      // Color when the chip is selected
      secondarySelectedColor: colorSchemeDark.secondary,
      // Color when the chip is selected, for secondary style
      labelStyle: TextStyle(color: colorSchemeDark.onPrimaryContainer),
      // Text style for chip labels
      secondaryLabelStyle: TextStyle(color: colorSchemeDark.onSecondary),
      // Text style for secondary chip labels
      brightness: Brightness.light,
      // Theme brightness, use Brightness.dark for dark mode
      padding: const EdgeInsets.all(4.0),
      // Padding inside the chip
      shape: RoundedRectangleBorder(
// Shape of the chip
        borderRadius: BorderRadius.circular(8.0),
      ),
// You can add other properties as needed
    );
