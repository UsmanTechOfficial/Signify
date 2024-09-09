import 'package:flutter/material.dart';

import '../theme.dart';

DataTableThemeData get dataTableTheme => DataTableThemeData(
      decoration: BoxDecoration(
        color: colorSchemeLight
            .surfaceContainerHighest, // Use the surfaceVariant color for DataTable background
      ),
      dataTextStyle: TextStyle(
        color: colorSchemeLight.onSurfaceVariant, // Use the onSurfaceVariant color for data text
        fontSize: 14.0, // Example size, adjust as needed
      ),
      headingTextStyle: TextStyle(
        color: colorSchemeLight.onSurface, // Use the onSurface color for heading text
        fontSize: 16.0, // Example size, adjust as needed
        fontWeight: FontWeight.bold, // Example weight, adjust as needed
      ),
      dividerThickness: 1.0, // Example thickness, adjust as needed
// You can add other properties as needed
    );

DataTableThemeData get darkDataTableTheme => DataTableThemeData(
      decoration: BoxDecoration(
        color: colorSchemeDark
            .surfaceContainerHighest, // Use the surfaceVariant color for DataTable background
      ),
      dataTextStyle: TextStyle(
        color: colorSchemeDark.onSurfaceVariant, // Use the onSurfaceVariant color for data text
        fontSize: 14.0, // Example size, adjust as needed
      ),
      headingTextStyle: TextStyle(
        color: colorSchemeDark.onSurface, // Use the onSurface color for heading text
        fontSize: 16.0, // Example size, adjust as needed
        fontWeight: FontWeight.bold, // Example weight, adjust as needed
      ),
      dividerThickness: 1.0, // Example thickness, adjust as needed
// You can add other properties as needed
    );
