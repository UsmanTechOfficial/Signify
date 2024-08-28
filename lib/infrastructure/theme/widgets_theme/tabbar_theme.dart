import 'package:flutter/material.dart';

import '../theme_library.dart';

TabBarTheme get tabBarTheme => TabBarTheme(
      labelColor: colorSchemeLight.primary,
      unselectedLabelColor: colorSchemeLight.outline,
      labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      indicatorColor: colorSchemeLight.primary,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: colorSchemeLight.primaryContainer,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );

TabBarTheme get darkTabBarTheme => TabBarTheme(
      labelColor: colorSchemeDark.primary,
      unselectedLabelColor: colorSchemeDark.outline,
      labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      indicatorColor: colorSchemeDark.primary,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: colorSchemeDark.primaryContainer,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
