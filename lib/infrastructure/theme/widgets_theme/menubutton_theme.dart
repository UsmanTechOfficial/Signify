import 'package:flutter/material.dart';

import '../theme_library.dart';

MenuButtonThemeData get menuButtonTheme => MenuButtonThemeData(
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        backgroundColor:
            WidgetStateProperty.all<Color>(colorSchemeLight.primary),
        foregroundColor:
            WidgetStateProperty.all<Color>(colorSchemeLight.onPrimary),
        overlayColor:
            WidgetStateProperty.all<Color>(colorSchemeLight.primaryContainer),
// Add other properties as needed
      ),
    );

MenuButtonThemeData get darkMenuButtonTheme => MenuButtonThemeData(
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        backgroundColor:
            WidgetStateProperty.all<Color>(colorSchemeDark.primary),
        foregroundColor:
            WidgetStateProperty.all<Color>(colorSchemeDark.onPrimary),
        overlayColor:
            WidgetStateProperty.all<Color>(colorSchemeDark.primaryContainer),
// Add other properties as needed
      ),
    );
