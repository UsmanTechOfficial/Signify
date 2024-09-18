import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

extension DateTimeFormatting on DateTime {
  String toFormattedDate() {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(this);
  }
}
