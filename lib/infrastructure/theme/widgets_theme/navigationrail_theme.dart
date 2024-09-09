import 'package:flutter/material.dart';

import '../theme.dart';

NavigationRailThemeData get navigationRailTheme => NavigationRailThemeData(
      backgroundColor: colorSchemeLight.surfaceContainerHighest,
      selectedIconTheme: IconThemeData(
        color: colorSchemeLight.primary,
      ),
      unselectedIconTheme: IconThemeData(
        color: colorSchemeLight.onSurfaceVariant,
      ),
      selectedLabelTextStyle: TextStyle(
        color: colorSchemeLight.onPrimaryContainer,
      ),
      unselectedLabelTextStyle: TextStyle(
        color: colorSchemeLight.onSurfaceVariant,
      ),
// Add other properties as needed
    );

NavigationRailThemeData get darkNavigationRailTheme => NavigationRailThemeData(
      backgroundColor: colorSchemeDark.surfaceContainerHighest,
      selectedIconTheme: IconThemeData(
        color: colorSchemeDark.primary,
      ),
      unselectedIconTheme: IconThemeData(
        color: colorSchemeDark.onSurfaceVariant,
      ),
      selectedLabelTextStyle: TextStyle(
        color: colorSchemeDark.onPrimaryContainer,
      ),
      unselectedLabelTextStyle: TextStyle(
        color: colorSchemeDark.onSurfaceVariant,
      ),
// Add other properties as needed
    );
