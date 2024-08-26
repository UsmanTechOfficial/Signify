import 'package:flutter/material.dart';

import '../theme_library.dart';

BottomAppBarTheme get bottomAppBarTheme => BottomAppBarTheme(
      color: colorSchemeLight
          .surface, // Use the surface color for BottomAppBar background
      // elevation: 4.0, // Example elevation, adjust as needed
    );

BottomAppBarTheme get darkBottomAppBarTheme => BottomAppBarTheme(
      color: colorSchemeDark
          .surface, // Use the surface color for BottomAppBar background
      // elevation: 4.0, // Example elevation, adjust as needed
    );
