import 'package:flutter/material.dart';

import '../theme_library.dart';

TabBarTheme get tabBarTheme => TabBarTheme(
      labelColor: colorSchemeLight.primary,
      unselectedLabelColor: colorSchemeLight.outline,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
      ),
      indicatorColor: colorSchemeLight.primary,
      indicatorSize: TabBarIndicatorSize.tab,
    );

TabBarTheme get darkTabBarTheme => TabBarTheme(
      labelColor: colorSchemeDark.primary,
      unselectedLabelColor: colorSchemeDark.outline,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
      ),
      indicatorColor: colorSchemeDark.primary,
      indicatorSize: TabBarIndicatorSize.tab,
    );
