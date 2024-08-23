import 'package:flutter/material.dart';

import '../theme_library.dart';

PopupMenuThemeData get popupMenuTheme => PopupMenuThemeData(
      color: colorSchemeLight.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      textStyle: TextStyle(color: colorSchemeLight.onSurface),
// Add other properties as needed
    );

PopupMenuThemeData get darkPopupMenuTheme => PopupMenuThemeData(
      color: colorSchemeDark.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      textStyle: TextStyle(color: colorSchemeDark.onSurface),
// Add other properties as needed
    );
