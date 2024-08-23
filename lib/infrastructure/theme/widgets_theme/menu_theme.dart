import 'package:flutter/material.dart';

import '../theme_library.dart';

MenuThemeData get menuTheme => MenuThemeData(
      style: MenuStyle(
        backgroundColor:
            WidgetStateProperty.all<Color>(colorSchemeLight.surface),
// surfaceTintColor: MaterialStateProperty.all<Color>(appSchemeDark.onSurface),
// shadowColor: MaterialStateProperty.all<Color>(appSchemeDark.primaryContainer.withOpacity(0.1)),
// Add other properties as needed
      ),
    );

MenuThemeData get darkMenuTheme => MenuThemeData(
      style: MenuStyle(
        backgroundColor:
            WidgetStateProperty.all<Color>(colorSchemeDark.surface),
// surfaceTintColor: MaterialStateProperty.all<Color>(appSchemeDark.onSurface),
// shadowColor: MaterialStateProperty.all<Color>(appSchemeDark.primaryContainer.withOpacity(0.1)),
// Add other properties as needed
      ),
    );
