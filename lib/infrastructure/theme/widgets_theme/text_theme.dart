import 'package:flutter/material.dart';

import '../theme.dart';

TextTheme get txtTheme => TextTheme(
      displayLarge: textStyle(colorSchemeLight.onPrimary,
          AppFontSize.displayLargeFont, FontWeight.w300),
      displayMedium: textStyle(colorSchemeLight.onPrimary,
          AppFontSize.displayMediumFont, FontWeight.w300),
      displaySmall: textStyle(colorSchemeLight.onPrimary,
          AppFontSize.displaySmallFont, FontWeight.w400),
      headlineLarge: textStyle(colorSchemeLight.onPrimary,
          AppFontSize.headlineLargeFont, FontWeight.w400),
      headlineMedium: textStyle(colorSchemeLight.onPrimary,
          AppFontSize.headlineMediumFont, FontWeight.w400),
      headlineSmall: textStyle(colorSchemeLight.onPrimary,
          AppFontSize.headlineSmallFont, FontWeight.w400),
      titleLarge: textStyle(colorSchemeLight.onPrimary,
          AppFontSize.titleLargeFont, FontWeight.w500),
      titleMedium: textStyle(colorSchemeLight.onPrimary,
          AppFontSize.titleMediumFont, FontWeight.w400),
      titleSmall: textStyle(colorSchemeLight.onPrimary,
          AppFontSize.titleSmallFont, FontWeight.w500),
      bodyLarge: textStyle(colorSchemeLight.onSurface,
          AppFontSize.bodyLargeFont, FontWeight.w400),
      bodyMedium: textStyle(colorSchemeLight.onSurface,
          AppFontSize.bodyMediumFont, FontWeight.w400),
      bodySmall: textStyle(colorSchemeLight.onSurface,
          AppFontSize.bodySmallFont, FontWeight.w400),
      labelLarge: textStyle(colorSchemeLight.onPrimary,
          AppFontSize.labelLargeFont, FontWeight.w500),
      labelMedium: textStyle(colorSchemeLight.onPrimary,
          AppFontSize.labelMediumFont, FontWeight.w500),
      labelSmall: textStyle(colorSchemeLight.onSurface,
          AppFontSize.labelSmallFont, FontWeight.w400),
    );

TextTheme get darkTxtTheme => TextTheme(
      displayLarge: textStyle(colorSchemeDark.onPrimary,
          AppFontSize.displayLargeFont, FontWeight.w300),
      displayMedium: textStyle(colorSchemeDark.onPrimary,
          AppFontSize.displayMediumFont, FontWeight.w300),
      displaySmall: textStyle(colorSchemeDark.onPrimary,
          AppFontSize.displaySmallFont, FontWeight.w400),
      headlineLarge: textStyle(colorSchemeDark.onPrimary,
          AppFontSize.headlineLargeFont, FontWeight.w400),
      headlineMedium: textStyle(colorSchemeDark.onPrimary,
          AppFontSize.headlineMediumFont, FontWeight.w400),
      headlineSmall: textStyle(colorSchemeDark.onPrimary,
          AppFontSize.headlineSmallFont, FontWeight.w400),
      titleLarge: textStyle(colorSchemeDark.onPrimary,
          AppFontSize.titleLargeFont, FontWeight.w500),
      titleMedium: textStyle(colorSchemeDark.onPrimary,
          AppFontSize.titleMediumFont, FontWeight.w400),
      titleSmall: textStyle(colorSchemeDark.onPrimary,
          AppFontSize.titleSmallFont, FontWeight.w500),
      bodyLarge: textStyle(colorSchemeDark.onSurface, AppFontSize.bodyLargeFont,
          FontWeight.w400),
      bodyMedium: textStyle(colorSchemeDark.onSurface,
          AppFontSize.bodyMediumFont, FontWeight.w400),
      bodySmall: textStyle(colorSchemeDark.onSurface, AppFontSize.bodySmallFont,
          FontWeight.w400),
      labelLarge: textStyle(colorSchemeDark.onPrimary,
          AppFontSize.labelLargeFont, FontWeight.w500),
      labelMedium: textStyle(colorSchemeDark.onPrimary,
          AppFontSize.labelMediumFont, FontWeight.w500),
      labelSmall: textStyle(colorSchemeDark.onSurface,
          AppFontSize.labelSmallFont, FontWeight.w400),
    );

TextStyle textStyle(Color color, double fontSize, FontWeight fontWeight) {
  return TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight);
}

// TextTheme get txtTheme => TextTheme(
//       displayLarge: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppFontSize.displayLargeFont,
//           fontWeight: FontWeight.w300),
//       displayMedium: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppFontSize.displayMediumFont,
//           fontWeight: FontWeight.w300),
//       displaySmall: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppFontSize.displaySmallFont,
//           fontWeight: FontWeight.w400),
//       headlineLarge: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppFontSize.headlineLargeFont,
//           fontWeight: FontWeight.w400),
//       headlineMedium: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppFontSize.headlineMediumFont,
//           fontWeight: FontWeight.w400),
//       headlineSmall: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppFontSize.headlineSmallFont,
//           fontWeight: FontWeight.w400),
//       titleLarge: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppFontSize.titleLargeFont,
//           fontWeight: FontWeight.w500),
//       titleMedium: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppFontSize.titleMediumFont,
//           fontWeight: FontWeight.w400),
//       titleSmall: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppFontSize.titleSmallFont,
//           fontWeight: FontWeight.w500),
//       bodyLarge: TextStyle(
//           color: colorSchemeLight.onSurface,
//           fontSize: AppFontSize.bodyLargeFont,
//           fontWeight: FontWeight.w400),
//       bodyMedium: TextStyle(
//           color: colorSchemeLight.onSurface,
//           fontSize: AppFontSize.bodyMediumFont,
//           fontWeight: FontWeight.w400),
//       bodySmall: TextStyle(
//           color: colorSchemeLight.onSurface,
//           fontSize: AppFontSize.bodySmallFont,
//           fontWeight: FontWeight.w400),
//       labelLarge: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppFontSize.labelLargeFont,
//           fontWeight: FontWeight.w500),
//       labelMedium: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppFontSize.labelMediumFont,
//           fontWeight: FontWeight.w500),
//       labelSmall: TextStyle(
//           color: colorSchemeLight.onSurface,
//           fontSize: AppFontSize.labelSmallFont,
//           fontWeight: FontWeight.w400),
//     );
//
// TextTheme get darkTxtTheme => TextTheme(
//       displayLarge: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppFontSize.displayLargeFont,
//           fontWeight: FontWeight.w300),
//       displayMedium: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppFontSize.displayMediumFont,
//           fontWeight: FontWeight.w300),
//       displaySmall: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppFontSize.displaySmallFont,
//           fontWeight: FontWeight.w400),
//       headlineLarge: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppFontSize.headlineLargeFont,
//           fontWeight: FontWeight.w400),
//       headlineMedium: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppFontSize.headlineMediumFont,
//           fontWeight: FontWeight.w400),
//       headlineSmall: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppFontSize.headlineSmallFont,
//           fontWeight: FontWeight.w400),
//       titleLarge: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppFontSize.titleLargeFont,
//           fontWeight: FontWeight.w500),
//       titleMedium: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppFontSize.titleMediumFont,
//           fontWeight: FontWeight.w400),
//       titleSmall: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppFontSize.titleSmallFont,
//           fontWeight: FontWeight.w500),
//       bodyLarge: TextStyle(
//           color: colorSchemeDark.onSurface,
//           fontSize: AppFontSize.bodyLargeFont,
//           fontWeight: FontWeight.w400),
//       bodyMedium: TextStyle(
//           color: colorSchemeDark.onSurface,
//           fontSize: AppFontSize.bodyMediumFont,
//           fontWeight: FontWeight.w400),
//       bodySmall: TextStyle(
//           color: colorSchemeDark.onSurface,
//           fontSize: AppFontSize.bodySmallFont,
//           fontWeight: FontWeight.w400),
//       labelLarge: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppFontSize.labelLargeFont,
//           fontWeight: FontWeight.w500),
//       labelMedium: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppFontSize.labelMediumFont,
//           fontWeight: FontWeight.w500),
//       labelSmall: TextStyle(
//           color: colorSchemeDark.onSurface,
//           fontSize: AppFontSize.labelSmallFont,
//           fontWeight: FontWeight.w400),
//     );
