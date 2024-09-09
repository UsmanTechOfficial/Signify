import 'package:flutter/material.dart';

import '../../../../../domain/consts/font_size.dart';
import '../../../../../domain/consts/styles.dart';

class CustomModelSheet {
  static void showBottomSheet({
    required BuildContext context,
    required String title,
    required Widget content,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppStyle.sheetRadius),
          topRight: Radius.circular(AppStyle.sheetRadius),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  Icons.horizontal_rule_rounded,
                  size: 50,
                  color: colorScheme.outlineVariant,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: AppFontSize.titleMediumFont,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 20,
                    ),
                  ),
                ],
              ),
              content,
            ],
          ),
        );
      },
    );
  }
}
