import 'package:flutter/material.dart';

extension SpacingExtensions on int {
  Widget height() => SizedBox(height: toDouble());

  Widget width() => SizedBox(width: toDouble());
}

extension StringExtension on String {
  String capitalizeFirst() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
