import 'package:flutter/material.dart';

import '../theme_library.dart';

SearchBarThemeData get searchBarTheme => SearchBarThemeData(
      backgroundColor: WidgetStateProperty.all<Color>(colorSchemeLight.surface),
      elevation: WidgetStateProperty.all<double>(2.0),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      ),
// Add other properties as needed
    );

SearchBarThemeData get darkSearchBarTheme => SearchBarThemeData(
      backgroundColor: WidgetStateProperty.all<Color>(colorSchemeDark.surface),
      elevation: WidgetStateProperty.all<double>(2.0),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      ),
// Add other properties as needed
    );
