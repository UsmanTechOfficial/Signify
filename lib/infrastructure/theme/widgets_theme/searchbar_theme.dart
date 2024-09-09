import 'package:flutter/material.dart';

import '../theme.dart';

SearchBarThemeData get searchBarTheme => SearchBarThemeData(
      backgroundColor:
          WidgetStateProperty.all<Color>(colorSchemeLight.outlineVariant.withOpacity(0.5)),
      elevation: WidgetStateProperty.all<double>(0),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
// Add other properties as needed
    );

SearchBarThemeData get darkSearchBarTheme => SearchBarThemeData(
      backgroundColor:
          WidgetStateProperty.all<Color>(colorSchemeDark.outlineVariant.withOpacity(0.5)),
      elevation: WidgetStateProperty.all<double>(0),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
// Add other properties as needed
    );
