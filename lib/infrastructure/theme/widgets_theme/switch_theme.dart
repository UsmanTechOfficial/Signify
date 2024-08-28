import 'package:flutter/material.dart';

import '../theme_library.dart';

SwitchThemeData get switchTheme => SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return colorSchemeLight.surface;
          }
          return colorSchemeLight.surface;
        },
      ),
      trackColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return colorSchemeLight.primary;
          }
          return colorSchemeLight.outlineVariant.withOpacity(0.5);
        },
      ),
      thumbIcon: WidgetStatePropertyAll(Icon(
        Icons.circle,
        color: colorSchemeLight.surface,
      )),
      trackOutlineColor: WidgetStateProperty.all(AppStyle.transparent),
      splashRadius: 20,
    );

SwitchThemeData get darkSwitchTheme => SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return colorSchemeDark.secondary;
          }
          return colorSchemeDark.onSurface.withOpacity(0.5);
        },
      ),
      trackColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return colorSchemeDark.secondary.withOpacity(0.5);
          }
          return colorSchemeDark.onSurface.withOpacity(0.1);
        },
      ),
      thumbIcon: const WidgetStatePropertyAll(Icon(Icons.circle)),
      trackOutlineColor: WidgetStateProperty.all(AppStyle.transparent),
      splashRadius: 20,
    );
