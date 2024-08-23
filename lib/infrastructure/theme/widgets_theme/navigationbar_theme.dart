import 'package:flutter/material.dart';

import '../theme_library.dart';

NavigationBarThemeData get navigationBarTheme => NavigationBarThemeData(
      backgroundColor: colorSchemeLight.surface,
      indicatorColor: colorSchemeLight.secondary,
      labelTextStyle: WidgetStateProperty.all(
        TextStyle(color: colorSchemeLight.onSurface),
      ),
      iconTheme: WidgetStateProperty.all(
        IconThemeData(color: colorSchemeLight.primary),
      ),
// Add other properties as needed
    );

NavigationBarThemeData get darkNavigationBarTheme => NavigationBarThemeData(
      backgroundColor: colorSchemeDark.surface,
      indicatorColor: colorSchemeDark.secondary,
      labelTextStyle: WidgetStateProperty.all(
        TextStyle(color: colorSchemeDark.onSurface),
      ),
      iconTheme: WidgetStateProperty.all(
        IconThemeData(color: colorSchemeDark.primary),
      ),
// Add other properties as needed
    );
