import 'package:flutter/material.dart';

import '../theme_library.dart';

CardTheme get cardTheme => CardTheme(
      color: colorSchemeLight
          .surface, // Use the surface color for card backgrounds
      shadowColor:
          colorSchemeLight.shadow, // Use the shadow color for card shadows
      elevation: 1.0, // Example elevation, adjust as needed
      shape: RoundedRectangleBorder(
// Example shape, adjust as needed
        borderRadius: BorderRadius.circular(4.0),
      ),
// You can add other properties as needed
    );

CardTheme get darkCardTheme => CardTheme(
      color:
          colorSchemeDark.surface, // Use the surface color for card backgrounds
      shadowColor:
          colorSchemeDark.shadow, // Use the shadow color for card shadows
      elevation: 1.0, // Example elevation, adjust as needed
      shape: RoundedRectangleBorder(
// Example shape, adjust as needed
        borderRadius: BorderRadius.circular(4.0),
      ),
// You can add other properties as needed
    );
