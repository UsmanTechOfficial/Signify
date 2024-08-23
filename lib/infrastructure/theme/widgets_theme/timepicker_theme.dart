import 'package:flutter/material.dart';

import '../theme_library.dart';

TimePickerThemeData get timePickerTheme => TimePickerThemeData(
      backgroundColor: colorSchemeLight.surface,
      dialHandColor: colorSchemeLight.primary,
      dialBackgroundColor: colorSchemeLight.surfaceContainerHighest,
      dayPeriodColor: colorSchemeLight.secondaryContainer,
      dayPeriodTextColor: colorSchemeLight.onSecondaryContainer,
      hourMinuteTextColor: colorSchemeLight.onPrimaryContainer,
      hourMinuteColor: colorSchemeLight.primaryContainer,
      entryModeIconColor: colorSchemeLight.tertiary,
      helpTextStyle: TextStyle(
        color: colorSchemeLight.onSurface,
        fontSize: 14, // Example size for Body Small
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      hourMinuteShape: RoundedRectangleBorder(
        side: BorderSide(
          color: colorSchemeLight.primary,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      dayPeriodShape: RoundedRectangleBorder(
        side: BorderSide(
          color: colorSchemeLight.secondary,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colorSchemeLight.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorSchemeLight.primary),
        ),
        labelStyle: TextStyle(
          color: colorSchemeLight.onSurface,
          fontSize: 16, // Example size for Body Large
        ),
      ),
// Define other properties if needed
    );

TimePickerThemeData get darkTimePickerTheme => TimePickerThemeData(
      backgroundColor: colorSchemeDark.surface,
      dialHandColor: colorSchemeDark.primary,
      dialBackgroundColor: colorSchemeDark.surfaceContainerHighest,
      dayPeriodColor: colorSchemeDark.secondaryContainer,
      dayPeriodTextColor: colorSchemeDark.onSecondaryContainer,
      hourMinuteTextColor: colorSchemeDark.onPrimaryContainer,
      hourMinuteColor: colorSchemeDark.primaryContainer,
      entryModeIconColor: colorSchemeDark.tertiary,
      helpTextStyle: TextStyle(
        color: colorSchemeDark.onSurface,
        fontSize: 14, // Example size for Body Small
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      hourMinuteShape: RoundedRectangleBorder(
        side: BorderSide(
          color: colorSchemeDark.primary,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      dayPeriodShape: RoundedRectangleBorder(
        side: BorderSide(
          color: colorSchemeDark.secondary,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colorSchemeDark.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorSchemeDark.primary),
        ),
        labelStyle: TextStyle(
          color: colorSchemeDark.onSurface,
          fontSize: 16, // Example size for Body Large
        ),
      ),
// Define other properties if needed
    );
