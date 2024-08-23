import 'package:flutter/material.dart';

import '../theme_library.dart';

SnackBarThemeData get snackBarTheme => SnackBarThemeData(
      backgroundColor: colorSchemeLight.surfaceContainerHighest,
      // Background color of the SnackBar
      actionTextColor: colorSchemeLight.primary,
      // Color of the action text
      disabledActionTextColor: colorSchemeLight.onSurface.withOpacity(0.38),
      // Color of the action text when it is disabled
      contentTextStyle: TextStyle(
        color: colorSchemeLight.onSurface, // Text color inside the SnackBar
        fontSize: 16, // Example size for Body Large
      ),
      elevation: 6.0,
      // Elevation of the SnackBar
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0), // Shape of the SnackBar
      ),
      behavior: SnackBarBehavior.floating,
      // Behavior of the SnackBar
      width: 280.0, // Width of the SnackBar
    );

SnackBarThemeData get darkSnackBarTheme => SnackBarThemeData(
      backgroundColor: colorSchemeDark.surfaceContainerHighest,
      // Background color of the SnackBar
      actionTextColor: colorSchemeDark.primary,
      // Color of the action text
      disabledActionTextColor: colorSchemeDark.onSurface.withOpacity(0.38),
      // Color of the action text when it is disabled
      contentTextStyle: TextStyle(
        color: colorSchemeDark.onSurface, // Text color inside the SnackBar
        fontSize: 16, // Example size for Body Large
      ),
      elevation: 6.0,
      // Elevation of the SnackBar
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0), // Shape of the SnackBar
      ),
      behavior: SnackBarBehavior.floating,
      // Behavior of the SnackBar
      width: 280.0, // Width of the SnackBar
    );
