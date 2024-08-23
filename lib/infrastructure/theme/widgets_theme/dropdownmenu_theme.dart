import 'package:flutter/material.dart';

import '../theme_library.dart';

DropdownMenuThemeData get dropdownMenuTheme => DropdownMenuThemeData(
      textStyle: TextStyle(color: colorSchemeLight.onSurface),
// You can add other properties as needed
    );

DropdownMenuThemeData get darkDropdownMenuTheme => DropdownMenuThemeData(
      textStyle: TextStyle(color: colorSchemeDark.onSurface),
// You can add other properties as needed
    );
