import 'package:flutter/material.dart';

import '../theme.dart';

AppBarTheme get appBarTheme => AppBarTheme(
    centerTitle: true,
    iconTheme: IconThemeData(
      size: 28,
      color: colorSchemeLight.onSurface,
    ),
    actionsIconTheme: IconThemeData(color: colorSchemeLight.onSurface),
    titleTextStyle: TextStyle(
      color: colorSchemeLight.onSurface,
      fontSize: AppFontSize.titleMediumFont,
      fontWeight: FontWeight.w500,
    ),
    toolbarTextStyle: TextStyle(
      color: colorSchemeLight.onSurface,
      fontSize: 18.0,
    ));

AppBarTheme get darkAppBarTheme => AppBarTheme(
    iconTheme: IconThemeData(color: colorSchemeDark.onSurface),
    actionsIconTheme: IconThemeData(color: colorSchemeDark.onPrimary),
    titleTextStyle: TextStyle(
      color: colorSchemeDark.onSurface,
      fontSize: AppFontSize.titleMediumFont,
      fontWeight: FontWeight.w500,
    ),
    toolbarTextStyle: TextStyle(
      color: colorSchemeDark.onSurface,
      fontSize: 18.0,
    ));
