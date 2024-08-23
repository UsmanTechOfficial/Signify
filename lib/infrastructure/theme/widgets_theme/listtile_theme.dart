import 'package:flutter/material.dart';

import '../theme_library.dart';

ListTileThemeData get listTileTheme => ListTileThemeData(
      tileColor: colorSchemeLight.surface,
      selectedColor: colorSchemeLight.primary,
      selectedTileColor: colorSchemeLight.outline.withOpacity(0.1),
      iconColor: colorSchemeLight.secondary,
      textColor: colorSchemeLight.onSurface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyle.borderRadius)),
// Add other properties as needed
    );

ListTileThemeData get darkListTileTheme => ListTileThemeData(
      tileColor: colorSchemeDark.surface,
      selectedColor: colorSchemeDark.primary,
      selectedTileColor: colorSchemeDark.outline.withOpacity(0.1),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      iconColor: colorSchemeDark.secondary,
      textColor: colorSchemeDark.onSurface,

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyle.borderRadius)),
// Add other properties as needed
    );
