import 'package:flutter/material.dart';

import '../theme.dart';

MenuBarThemeData get menuBarTheme => MenuBarThemeData(
      style: MenuStyle(
        backgroundColor:
            WidgetStateProperty.all<Color>(colorSchemeLight.surface),
// surfaceTintColor: MaterialStateProperty.all<Color>(appSchemeDark.onSurface),
// shadowColor: MaterialStateProperty.all<Color>(appSchemeDark.primaryContainer.withOpacity(0.1)),
// Add other properties as needed
      ),
    );

MenuBarThemeData get darkMenuBarTheme => MenuBarThemeData(
      style: MenuStyle(
        backgroundColor:
            WidgetStateProperty.all<Color>(colorSchemeDark.surface),
// surfaceTintColor: MaterialStateProperty.all<Color>(appSchemeDark.onSurface),
// shadowColor: MaterialStateProperty.all<Color>(appSchemeDark.primaryContainer.withOpacity(0.1)),
// Add other properties as needed
      ),
    );
