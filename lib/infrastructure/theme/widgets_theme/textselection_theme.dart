import 'package:flutter/material.dart';

import '../theme.dart';

TextSelectionThemeData get textSelectionTheme => TextSelectionThemeData(
      cursorColor: colorSchemeLight.primary,
      // Color of the cursor
      selectionColor: colorSchemeLight.primaryContainer,
      // Color of the selection rectangle
      selectionHandleColor:
          colorSchemeLight.secondary, // Color of the drag handles
// Add other properties as needed
    );

TextSelectionThemeData get darkTextSelectionTheme => TextSelectionThemeData(
      cursorColor: colorSchemeDark.primary,
      // Color of the cursor
      selectionColor: colorSchemeDark.primaryContainer,
      // Color of the selection rectangle
      selectionHandleColor:
          colorSchemeDark.secondary, // Color of the drag handles
// Add other properties as needed
    );
