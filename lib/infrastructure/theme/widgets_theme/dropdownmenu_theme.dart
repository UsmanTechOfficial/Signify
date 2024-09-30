import 'package:flutter/material.dart';

import '../theme.dart';

DropdownMenuThemeData get dropdownMenuTheme => DropdownMenuThemeData(
      textStyle: TextStyle(color: colorSchemeLight.onSurface),
      menuStyle: MenuStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
            side: BorderSide(color: colorSchemeLight.outline), // Border color
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        // focusColor: colorSchemeLight.primary,
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
          borderSide: BorderSide(
            color: colorSchemeLight.outlineVariant, // Border color
          ),
        ),
      ),
    );

DropdownMenuThemeData get darkDropdownMenuTheme => DropdownMenuThemeData(
      textStyle: TextStyle(color: colorSchemeDark.onSurface),
      menuStyle: MenuStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
            side: BorderSide(color: colorSchemeDark.outline), // Border color
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
          borderSide: BorderSide(
            color: colorSchemeDark.outlineVariant, // Border color
          ),
        ),
      ),
    );
