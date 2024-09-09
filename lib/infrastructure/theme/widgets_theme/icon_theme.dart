import 'package:flutter/material.dart';

import '../theme.dart';

IconThemeData get iconThemeData => IconThemeData(
    color:
        colorSchemeLight.onPrimary // Use the onPrimary color for AppBar icons
    );

IconThemeData get darkIconThemeData => IconThemeData(
    color: colorSchemeDark.onPrimary // Use the onPrimary color for AppBar icons
    );
