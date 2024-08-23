import 'package:flutter/material.dart';

import '../theme_library.dart';

ScrollbarThemeData get scrollbarTheme => ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(colorSchemeLight.primary),
      trackColor: WidgetStateProperty.all(colorSchemeLight.surface),
      trackBorderColor: WidgetStateProperty.all(colorSchemeLight.outline),
      crossAxisMargin: 2.0,
      mainAxisMargin: 2.0,
      radius: const Radius.circular(8),
      thickness: WidgetStateProperty.all(8.0),
    );

ScrollbarThemeData get darkScrollbarTheme => ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(colorSchemeDark.primary),
      trackColor: WidgetStateProperty.all(colorSchemeDark.surface),
      trackBorderColor: WidgetStateProperty.all(colorSchemeDark.outline),
      crossAxisMargin: 2.0,
      mainAxisMargin: 2.0,
      radius: const Radius.circular(8),
      thickness: WidgetStateProperty.all(8.0),
    );
