import 'package:flutter/material.dart';

import '../theme.dart';

RadioThemeData get radioThemeData => RadioThemeData(
      fillColor: WidgetStateProperty.all(colorSchemeLight.outlineVariant),
      overlayColor: WidgetStateProperty.all(colorSchemeLight.onPrimary.withOpacity(0.2)),
      splashRadius: 24, // Default splash radius
    );

RadioThemeData get darkRadioThemeData => RadioThemeData(
      fillColor: WidgetStateProperty.all(colorSchemeDark.primary),
      overlayColor: WidgetStateProperty.all(colorSchemeDark.onPrimary.withOpacity(0.2)),
      splashRadius: 24, // Default splash radius
    );
