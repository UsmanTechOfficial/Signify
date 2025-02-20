import 'package:flutter/material.dart';

import '../theme.dart';

BottomAppBarTheme get bottomAppBarTheme => BottomAppBarTheme(
      surfaceTintColor: colorSchemeLight.secondary,
      color: colorSchemeLight.surface, // Use the surface color for BottomAppBar background
      // elevation: 4.0, // Example elevation, adjust as needed
    );

BottomAppBarTheme get darkBottomAppBarTheme => BottomAppBarTheme(
      surfaceTintColor: colorSchemeDark.secondary,
      color: colorSchemeDark.surface, // Use the surface color for BottomAppBar background
      // elevation: 4.0, // Example elevation, adjust as needed
    );
