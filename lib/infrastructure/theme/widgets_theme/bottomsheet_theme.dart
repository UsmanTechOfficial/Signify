import 'package:flutter/material.dart';

import '../theme_library.dart';

BottomSheetThemeData get bottomSheetTheme => BottomSheetThemeData(
      backgroundColor: colorSchemeLight.surface,
      // Use the surface color for BottomSheet background
      modalBackgroundColor: colorSchemeLight.surfaceContainerHighest,
      // Use the surfaceVariant color for modal BottomSheet background
      modalElevation: 6.0,
      // Example elevation for modal BottomSheet, adjust as needed
      shape: const RoundedRectangleBorder(
// Example shape, adjust as needed
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
// You can add other properties as needed
    );

BottomSheetThemeData get darkBottomSheetTheme => BottomSheetThemeData(
      backgroundColor: colorSchemeDark.surface,
      // Use the surface color for BottomSheet background
      modalBackgroundColor: colorSchemeDark.surfaceContainerHighest,
      // Use the surfaceVariant color for modal BottomSheet background
      modalElevation: 6.0,
      // Example elevation for modal BottomSheet, adjust as needed
      shape: const RoundedRectangleBorder(
// Example shape, adjust as needed
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
// You can add other properties as needed
    );
