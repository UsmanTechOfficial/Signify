import 'package:flutter/material.dart';

import '../theme.dart';

DrawerThemeData get drawerTheme => DrawerThemeData(
      backgroundColor: colorSchemeLight.surface,
      shadowColor: colorSchemeLight.shadow,
      // scrimColor: colorSchemeLight.scrim,
      elevation: 16.0,
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     topRight: Radius.circular(20.0),
      //     bottomRight: Radius.circular(20.0),
      //   ),
      // ),
    );

DrawerThemeData get darkDrawerTheme => DrawerThemeData(
      backgroundColor: colorSchemeDark.surface,
      // scrimColor: colorSchemeDark.scrim,
      shadowColor: colorSchemeDark.shadow,
      elevation: 16.0,
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     topRight: Radius.circular(20.0),
      //     bottomRight: Radius.circular(20.0),
      //   ),
      // ),
    );
