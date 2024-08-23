import 'package:flutter/material.dart';

import '../theme_library.dart';

SliderThemeData get sliderTheme => SliderThemeData(
      activeTrackColor: colorSchemeLight.primary,
      inactiveTrackColor: colorSchemeLight.primaryContainer,
      thumbColor: colorSchemeLight.secondary,
      overlayColor: colorSchemeLight.secondaryContainer.withOpacity(0.2),
      valueIndicatorColor: colorSchemeLight.tertiary,
// Add other properties as needed
    );

SliderThemeData get darkSliderTheme => SliderThemeData(
      activeTrackColor: colorSchemeDark.primary,
      inactiveTrackColor: colorSchemeDark.primaryContainer,
      thumbColor: colorSchemeDark.secondary,
      overlayColor: colorSchemeDark.secondaryContainer.withOpacity(0.2),
      valueIndicatorColor: colorSchemeDark.tertiary,
// Add other properties as needed
    );
