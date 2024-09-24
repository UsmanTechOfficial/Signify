import 'package:flutter/material.dart';

import '../theme.dart';

MaterialBannerThemeData get bannerTheme => MaterialBannerThemeData(
      backgroundColor: colorSchemeLight.secondaryContainer,
      contentTextStyle: TextStyle(
        color: colorSchemeLight.onSecondaryContainer,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      ),
      leadingPadding: const EdgeInsets.all(10),
      // Example padding, adjust as needed
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
    );

MaterialBannerThemeData get darkBannerTheme => MaterialBannerThemeData(
      backgroundColor: colorSchemeDark.secondaryContainer,
      contentTextStyle: TextStyle(
        color: colorSchemeDark.onSecondaryContainer,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      ),
      leadingPadding: const EdgeInsets.all(10),
      // Example padding, adjust as needed
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Example padding, adjust as needed
    );
