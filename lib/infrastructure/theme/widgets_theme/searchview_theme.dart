import 'package:flutter/material.dart';

import '../theme_library.dart';

SearchViewThemeData get searchViewTheme => SearchViewThemeData(
      backgroundColor: colorSchemeLight.surface,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    );

SearchViewThemeData get darkSearchViewTheme => SearchViewThemeData(
      backgroundColor: colorSchemeDark.surface,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
