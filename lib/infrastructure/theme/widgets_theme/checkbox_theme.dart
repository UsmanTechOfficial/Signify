import 'package:flutter/material.dart';

import '../theme.dart';

CheckboxThemeData get checkboxTheme => CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return colorSchemeLight.primary;
      }
      return colorSchemeLight.outlineVariant.withOpacity(0.5);
    }),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    side: BorderSide(width: 1, color: colorSchemeLight.outline),
    checkColor: WidgetStateProperty.all<Color>(colorSchemeLight.onPrimary),
    overlayColor: WidgetStateProperty.all<Color>(colorSchemeLight.secondaryContainer),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    splashRadius: 0);

CheckboxThemeData get darkCheckboxTheme => CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return colorSchemeDark.primary;
      }
      return colorSchemeDark.outlineVariant.withOpacity(0.5);
    }),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    side: BorderSide(width: 1, color: colorSchemeDark.outline),
    checkColor: WidgetStateProperty.all<Color>(colorSchemeDark.onPrimary),
    overlayColor: WidgetStateProperty.all<Color>(
      colorSchemeDark.secondaryContainer,
    ),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    splashRadius: 0);
