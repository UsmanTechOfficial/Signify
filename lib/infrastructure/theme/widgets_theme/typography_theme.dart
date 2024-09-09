import 'package:flutter/material.dart';

import '../theme.dart';

Typography get typography => Typography.material2018(
      platform: TargetPlatform.android,
      black: Typography.blackMountainView.apply(
        bodyColor: colorSchemeLight.onSurface,
        displayColor: colorSchemeLight.onSurface,
      ),
      white: Typography.whiteMountainView.apply(
        bodyColor: colorSchemeLight.onSurface,
        displayColor: colorSchemeLight.onSurface,
      ),
      englishLike: Typography.englishLike2018.apply(
        bodyColor: colorSchemeLight.primary,
        displayColor: colorSchemeLight.primary,
      ),
      dense: Typography.dense2018.apply(
        bodyColor: colorSchemeLight.secondary,
        displayColor: colorSchemeLight.secondary,
      ),
      tall: Typography.tall2018.apply(
        bodyColor: colorSchemeLight.tertiary,
        displayColor: colorSchemeLight.tertiary,
      ),
    );

Typography get darkTypography => Typography.material2018(
      platform: TargetPlatform.android,
      black: Typography.blackMountainView.apply(
        bodyColor: colorSchemeDark.onSurface,
        displayColor: colorSchemeDark.onSurface,
      ),
      white: Typography.whiteMountainView.apply(
        bodyColor: colorSchemeDark.onSurface,
        displayColor: colorSchemeDark.onSurface,
      ),
      englishLike: Typography.englishLike2018.apply(
        bodyColor: colorSchemeDark.primary,
        displayColor: colorSchemeDark.primary,
      ),
      dense: Typography.dense2018.apply(
        bodyColor: colorSchemeDark.secondary,
        displayColor: colorSchemeDark.secondary,
      ),
      tall: Typography.tall2018.apply(
        bodyColor: colorSchemeDark.tertiary,
        displayColor: colorSchemeDark.tertiary,
      ),
    );
