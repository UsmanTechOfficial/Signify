import 'package:flutter/material.dart';

import '../theme_library.dart';

DialogTheme get dialogTheme => DialogTheme(
      backgroundColor: colorSchemeLight.surface,
      // Use the surface color for dialog backgrounds
      titleTextStyle: TextStyle(
        color: colorSchemeLight
            .onSurface, // Use the onSurface color for dialog title text
        fontSize: 20.0, // Example size, adjust as needed
        fontWeight: FontWeight.bold, // Example weight, adjust as needed
      ),
      contentTextStyle: TextStyle(
        color: colorSchemeLight
            .onSurface, // Use the onSurface color for dialog content text
        fontSize: 16.0, // Example size, adjust as needed
      ),
      elevation: 24.0,
      // Example elevation, adjust as needed
      shape: RoundedRectangleBorder(
// Example shape, adjust as needed
        borderRadius: BorderRadius.circular(4.0),
      ),
// You can add other properties as needed
    );

DialogTheme get darkDialogTheme => DialogTheme(
      backgroundColor: colorSchemeDark.surface,
      // Use the surface color for dialog backgrounds
      titleTextStyle: TextStyle(
        color: colorSchemeDark
            .onSurface, // Use the onSurface color for dialog title text
        fontSize: 20.0, // Example size, adjust as needed
        fontWeight: FontWeight.bold, // Example weight, adjust as needed
      ),
      contentTextStyle: TextStyle(
        color: colorSchemeDark
            .onSurface, // Use the onSurface color for dialog content text
        fontSize: 16.0, // Example size, adjust as needed
      ),
      elevation: 24.0,
      // Example elevation, adjust as needed
      shape: RoundedRectangleBorder(
// Example shape, adjust as needed
        borderRadius: BorderRadius.circular(4.0),
      ),
// You can add other properties as needed
    );
