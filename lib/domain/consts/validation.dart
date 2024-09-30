import 'package:flutter/material.dart';

class Validation {
  static String? psdValidation(TextEditingController controller) {
    final password = controller.text.trim();

    if (password.isEmpty) {
      return 'Password is required';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }

    return null;
  }

  static String? emailValidation(TextEditingController controller) {
    final email = controller.text.trim();

    if (email.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return 'Enter a valid email';
    }

    return null;
  }

  static String? validate(TextEditingController controller, String field) {
    final text = controller.text.trim();

    if (text.isEmpty) {
      return '$field is required';
    }

    return null;
  }

  static String? dropDownValidation(String value) {
    final text = value.trim();

    if (text.isEmpty) {
      return 'select a value';
    }

    return null;
  }
}
