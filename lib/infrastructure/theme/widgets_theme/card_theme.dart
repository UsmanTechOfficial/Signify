import 'package:flutter/material.dart';

import '../theme.dart';

CardTheme get cardTheme => CardTheme(
      color: colorSchemeLight.surface,
      shadowColor: colorSchemeLight.shadow,
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );

CardTheme get darkCardTheme => CardTheme(
      color: colorSchemeDark.surface,
      shadowColor: colorSchemeDark.shadow,
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
