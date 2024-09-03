import 'package:flutter/material.dart';

import '../theme_library.dart';

AppBarTheme get appBarTheme => AppBarTheme(
    iconTheme: IconThemeData(
      size: 28,
      color: colorSchemeLight.onSurface,
    ),
    actionsIconTheme: IconThemeData(color: colorSchemeLight.onSurface),
    titleTextStyle: TextStyle(
      color: colorSchemeLight.onSurface,
      fontSize: AppFontSize.titleLargeFont,
    ),
    toolbarTextStyle: TextStyle(
      color: colorSchemeLight.onSurface,
      fontSize: 18.0,
    ));

AppBarTheme get darkAppBarTheme => AppBarTheme(
    iconTheme: IconThemeData(color: colorSchemeDark.onSurface),
    actionsIconTheme: IconThemeData(color: colorSchemeDark.onPrimary),
    titleTextStyle: TextStyle(
        color: colorSchemeDark.onSurface, fontSize: AppFontSize.titleLargeFont),
    toolbarTextStyle: TextStyle(
      color: colorSchemeDark.onSurface,
      fontSize: 18.0,
    ));
