import 'package:flutter/material.dart';

import '../theme_library.dart';

InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    border: InputBorder.none,
    enabledBorder: _outlineInputBorder(borderColor: Colors.transparent),
    focusedBorder: _outlineInputBorder(borderColor: colorSchemeLight.primary),
    errorBorder: _outlineInputBorder(borderColor: colorSchemeLight.error),
    focusedErrorBorder:
        _outlineInputBorder(borderColor: colorSchemeLight.error),
    labelStyle: _textStyle(color: colorSchemeLight.onSurface, fontSize: 16),
    floatingLabelStyle:
        _textStyle(color: colorSchemeLight.primary, fontSize: 18),
    hintStyle: _textStyle(color: colorSchemeLight.outline, fontSize: 14),
    errorStyle: _textStyle(color: colorSchemeLight.error, fontSize: 12),
    prefixStyle: _textStyle(color: colorSchemeLight.primary),
    suffixStyle: _textStyle(color: colorSchemeLight.onSurface),
    prefixIconColor: colorSchemeLight.primary,
    suffixIconColor: colorSchemeLight.primary,
    filled: true,
    fillColor: colorSchemeLight.primary.withAlpha(40),
    helperStyle: _textStyle(color: colorSchemeLight.onSurfaceVariant),
    counterStyle: _textStyle(color: colorSchemeLight.primary),
    isDense: false);

InputDecorationTheme get darkInputDecorationTheme => InputDecorationTheme(
    border: InputBorder.none,
    enabledBorder: _outlineInputBorder(borderColor: Colors.transparent),
    focusedBorder: _outlineInputBorder(borderColor: colorSchemeDark.primary),
    errorBorder: _outlineInputBorder(borderColor: colorSchemeDark.error),
    focusedErrorBorder: _outlineInputBorder(borderColor: colorSchemeDark.error),
    labelStyle: _textStyle(color: colorSchemeDark.onSurface, fontSize: 16),
    floatingLabelStyle:
        _textStyle(color: colorSchemeDark.primary, fontSize: 18),
    hintStyle: _textStyle(color: colorSchemeDark.outline, fontSize: 14),
    errorStyle: _textStyle(color: colorSchemeDark.error, fontSize: 12),
    prefixStyle: _textStyle(color: colorSchemeDark.primary),
    suffixStyle: _textStyle(color: colorSchemeDark.onSurface),
    prefixIconColor: colorSchemeDark.primary,
    suffixIconColor: colorSchemeDark.primary,
    filled: true,
    fillColor: colorSchemeDark.primary.withAlpha(70),
    helperStyle: _textStyle(color: colorSchemeDark.onSurfaceVariant),
    counterStyle: _textStyle(color: colorSchemeDark.primary),
    isDense: false);

/// Reusable widget
TextStyle _textStyle({Color? color, double? fontSize}) {
  return TextStyle(color: color, fontSize: fontSize);
}

OutlineInputBorder _outlineInputBorder(
    {double borderRadius = AppStyle.borderRadius, required Color borderColor}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: borderColor));
}
