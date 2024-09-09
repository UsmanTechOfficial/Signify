import 'package:flutter/material.dart';

import '../../../../../../assets_gen/assets.gen.dart';
import '../../../../../../domain/consts/consts.dart';

class CustomBottomSheetTile extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String subtitle;
  final Widget? icon;
  final VoidCallback onTap;

  const CustomBottomSheetTile({
    super.key,
    this.isSelected = false,
    required this.title,
    required this.subtitle,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: SizedBox(
        height: 90,
        child: Card(
          elevation: 8,
          child: ListTile(
            selected: isSelected,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            onTap: onTap,
            style: ListTileStyle.drawer,
            leading: CircleAvatar(
              backgroundColor:
                  isSelected ? colorScheme.surface : colorScheme.outlineVariant.withOpacity(0.5),
              child: icon ?? Assets.icons.docIcon.svg(),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
                color: isSelected ? colorScheme.surface : colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(
                fontSize: AppFontSize.labelSmallFont,
                color: isSelected ? colorScheme.surface : colorScheme.outline,
              ),
            ),
            selectedTileColor: colorScheme.primary,
            selectedColor: colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppStyle.tileBorderRadius),
            ),
          ),
        ),
      ),
    );
  }
}
