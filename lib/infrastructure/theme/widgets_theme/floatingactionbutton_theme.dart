import 'package:flutter/material.dart';

import '../theme.dart';

FloatingActionButtonThemeData get floatingActionButtonTheme => FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      backgroundColor: colorSchemeLight.primary,
      foregroundColor: colorSchemeLight.onPrimary,
      hoverColor: colorSchemeLight.primaryContainer.withOpacity(0.1),
      focusColor: colorSchemeLight.primaryContainer.withOpacity(0.2),
      splashColor: colorSchemeLight.secondaryContainer.withOpacity(0.2),
// Add other properties as needed
    );

FloatingActionButtonThemeData get darkFloatingActionButtonTheme => FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      backgroundColor: colorSchemeDark.primary,
      foregroundColor: colorSchemeDark.onPrimary,
      hoverColor: colorSchemeDark.primaryContainer.withOpacity(0.1),
      focusColor: colorSchemeDark.primaryContainer.withOpacity(0.2),
      splashColor: colorSchemeDark.secondaryContainer.withOpacity(0.2),
// Add other properties as needed
    );
