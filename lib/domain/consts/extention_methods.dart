import 'package:flutter/material.dart';

extension SpacingExtensions on int {
  Widget height() => SizedBox(height: toDouble());

  Widget width() => SizedBox(width: toDouble());
}

extension Padding on Widget {
  EdgeInsets horizontalPadding(size) =>
      EdgeInsets.symmetric(horizontal: size.toDouble());

  EdgeInsets verticalPadding(size) =>
      EdgeInsets.symmetric(vertical: size.toDouble());

  EdgeInsets symmetricPadding(
      {required double horizontal, required double vertical}) {
    return EdgeInsets.symmetric(
      horizontal: horizontal,
      vertical: vertical,
    );
  }
}
