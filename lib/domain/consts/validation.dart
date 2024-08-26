import 'package:flutter/material.dart';

class Validation {
  static String? psdValidation(TextEditingController controller) {
    final password = controller.text;

    if (password.isEmpty) {
      return 'Password is required';
    } else if (password.length < 8) {
      return 'Must be at least 8 characters';
    }

    return null;
  }

  static String? emailValidation(TextEditingController controller) {
    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(controller.text)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validate(TextEditingController controller, String field) {
    if (controller.text.isEmpty) {
      return '$field is required';
    }

    return null;
  }
}
