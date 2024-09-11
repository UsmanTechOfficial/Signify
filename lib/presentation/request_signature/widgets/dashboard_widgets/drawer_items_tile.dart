import 'package:flutter/material.dart';

import '../../../../assets_gen/assets.gen.dart';
import '../../../../domain/consts/font_size.dart';
import '../../../../domain/consts/global_var.dart';
import '../../../widgets/text/custom_text.dart';

class DrawerItemsTile extends StatelessWidget {
  final bool isSelected;
  final VoidCallback? onTap;
  final String title;
  final String icon;

  const DrawerItemsTile({
    super.key,
    required this.isSelected,
    this.onTap,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    return ListTile(
      selected: isSelected,
      dense: true,
      shape: const RoundedRectangleBorder(),
      leading: SvgGenImage(icon).svg(
          colorFilter: ColorFilter.mode(
        isSelected ? color.surface : color.onSurface,
        BlendMode.srcIn,
      )),
      title: CustomText(
        title,
        color: isSelected ? color.surface : color.onSurface,
        fontSize: AppFontSize.labelMediumFont,
        fontWeight: FontWeight.w400,
      ),
      onTap: onTap,
    );
  }
}
