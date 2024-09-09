import 'package:flutter/material.dart';

extension SpacingExtensions on int {
  Widget height() => SizedBox(height: toDouble());

  Widget width() => SizedBox(width: toDouble());
}
