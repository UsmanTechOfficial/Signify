import 'package:flutter/material.dart';

import '../theme_library.dart';

ExpansionTileThemeData get expansionTileTheme => ExpansionTileThemeData(
      backgroundColor: colorSchemeLight.surface,
      iconColor: colorSchemeLight.secondary,
      collapsedIconColor: colorSchemeLight.onSurface,
      textColor: colorSchemeLight.onSurface,
      collapsedTextColor: colorSchemeLight.onSurfaceVariant,
      tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
      expandedAlignment: Alignment.centerLeft,
      childrenPadding: const EdgeInsets.symmetric(vertical: 8.0),
    );

ExpansionTileThemeData get darkExpansionTileTheme => ExpansionTileThemeData(
      backgroundColor: colorSchemeDark.surface,
      iconColor: colorSchemeDark.secondary,
      collapsedIconColor: colorSchemeDark.onSurface,
      textColor: colorSchemeDark.onSurface,
      collapsedTextColor: colorSchemeDark.onSurfaceVariant,
      tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
      expandedAlignment: Alignment.centerLeft,
      childrenPadding: const EdgeInsets.symmetric(vertical: 8.0),
    );
