import 'package:flutter/material.dart';

import '../theme_library.dart';

BottomNavigationBarThemeData get bottomNavigationBarTheme =>
    BottomNavigationBarThemeData(
        backgroundColor: colorSchemeLight.surface,
        // Use the surface color for background
        selectedItemColor: colorSchemeLight.primary,
        // Use the primary color for selected item
        unselectedItemColor: colorSchemeLight.onSurface.withOpacity(0.60),
        // Use the onSurface color with opacity for unselected items
        selectedIconTheme: IconThemeData(
          color: colorSchemeLight
              .primary, // Use the primary color for selected icons
        ),
        unselectedIconTheme: IconThemeData(
          color: colorSchemeLight.onSurface.withOpacity(
              0.60), // Use the onSurface color with opacity for unselected icons
        ),
        selectedLabelStyle: TextStyle(
          color: colorSchemeLight
              .primary, // Use the primary color for selected labels
        ),
        unselectedLabelStyle: TextStyle(
          color: colorSchemeLight.onSurface.withOpacity(
              0.60), // Use the onSurface color with opacity for unselected labels
        ));

BottomNavigationBarThemeData get darkBottomNavigationBarTheme =>
    BottomNavigationBarThemeData(
        backgroundColor: colorSchemeDark.surface,
        // Use the surface color for background
        selectedItemColor: colorSchemeDark.primary,
        // Use the primary color for selected item
        unselectedItemColor: colorSchemeDark.onSurface.withOpacity(0.60),
        // Use the onSurface color with opacity for unselected items
        selectedIconTheme: IconThemeData(
          color: colorSchemeDark
              .primary, // Use the primary color for selected icons
        ),
        unselectedIconTheme: IconThemeData(
          color: colorSchemeDark.onSurface.withOpacity(
              0.60), // Use the onSurface color with opacity for unselected icons
        ),
        selectedLabelStyle: TextStyle(
          color: colorSchemeDark
              .primary, // Use the primary color for selected labels
        ),
        unselectedLabelStyle: TextStyle(
          color: colorSchemeDark.onSurface.withOpacity(
              0.60), // Use the onSurface color with opacity for unselected labels
        ));
