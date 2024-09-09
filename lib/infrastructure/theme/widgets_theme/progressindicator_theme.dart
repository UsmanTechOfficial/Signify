import 'package:flutter/material.dart';

import '../theme.dart';

ProgressIndicatorThemeData get progressIndicatorTheme => ProgressIndicatorThemeData(
      color: colorSchemeLight.secondary,
      linearTrackColor: colorSchemeLight.surface,
      circularTrackColor: colorSchemeLight.surfaceContainerHighest,
// Add other properties as needed
    );

ProgressIndicatorThemeData get darkProgressIndicatorTheme => ProgressIndicatorThemeData(
      color: colorSchemeDark.secondary,
      linearTrackColor: colorSchemeDark.surface,
      circularTrackColor: colorSchemeDark.surfaceContainerHighest,
// Add other properties as needed
    );
