import 'package:flutter/material.dart';

import '../theme.dart';

ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        backgroundColor: WidgetStateProperty.all(colorSchemeLight.primary),
        foregroundColor: WidgetStateProperty.all(colorSchemeLight.onPrimary),
        overlayColor: WidgetStateProperty.all(colorSchemeLight.primaryContainer.withOpacity(0.2)),
        shadowColor: WidgetStateProperty.all(colorSchemeLight.shadow),
        elevation: WidgetStateProperty.all(2),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 16, // Example size for Body Large
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );

ElevatedButtonThemeData get darkElevatedButtonTheme => ElevatedButtonThemeData(
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        backgroundColor: WidgetStateProperty.all(colorSchemeDark.primary),
        foregroundColor: WidgetStateProperty.all(colorSchemeDark.onPrimary),
        overlayColor: WidgetStateProperty.all(colorSchemeDark.primaryContainer.withOpacity(0.2)),
        shadowColor: WidgetStateProperty.all(colorSchemeDark.shadow),
        elevation: WidgetStateProperty.all(2),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 16, // Example size for Body Large
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
