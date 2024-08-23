import 'package:flutter/material.dart';

import '../theme_library.dart';

TabBarTheme get tabBarTheme => TabBarTheme(
// The color of the tab labels
      labelColor: colorSchemeLight.onPrimary,
// The color of the unselected tab labels
      unselectedLabelColor: colorSchemeLight.onSurfaceVariant,
// The padding added to each of the tab labels
      labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
// The style of text to display for the tab labels
      labelStyle: const TextStyle(
        fontSize: 16, // Example size for Body Large
        fontWeight: FontWeight.w500,
      ),
// The style of text to display for the unselected tab labels
      unselectedLabelStyle: const TextStyle(
        fontSize: 14, // Example size for Body Small
        fontWeight: FontWeight.w400,
      ),
// The color of the tab indicator
      indicatorColor: colorSchemeLight.primary,
// The size/shape of the tab indicator
      indicatorSize: TabBarIndicatorSize.tab,
// The padding added to the tab indicator

// The decoration to paint behind the tab labels
      indicator: BoxDecoration(
        color: colorSchemeLight.primaryContainer,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );

TabBarTheme get darkTabBarTheme => TabBarTheme(
// The color of the tab labels
      labelColor: colorSchemeDark.onPrimary,
// The color of the unselected tab labels
      unselectedLabelColor: colorSchemeDark.onSurfaceVariant,
// The padding added to each of the tab labels
      labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
// The style of text to display for the tab labels
      labelStyle: const TextStyle(
        fontSize: 16, // Example size for Body Large
        fontWeight: FontWeight.w500,
      ),
// The style of text to display for the unselected tab labels
      unselectedLabelStyle: const TextStyle(
        fontSize: 14, // Example size for Body Small
        fontWeight: FontWeight.w400,
      ),
// The color of the tab indicator
      indicatorColor: colorSchemeDark.primary,
// The size/shape of the tab indicator
      indicatorSize: TabBarIndicatorSize.tab,
// The padding added to the tab indicator

// The decoration to paint behind the tab labels
      indicator: BoxDecoration(
        color: colorSchemeDark.primaryContainer,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
