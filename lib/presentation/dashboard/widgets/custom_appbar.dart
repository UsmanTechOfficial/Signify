import 'package:flutter/material.dart';

import '../../../domain/consts/font_size.dart';
import '../../../domain/consts/global_var.dart';
import '../../widgets/text/custom_text.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    this.leading,
    required this.title,
    this.action,
    this.bottom,
    this.pinned = false,
    this.floating = true,
    this.snap = true,
  });

  final Widget? leading;
  final String title;
  final Widget? action;
  final PreferredSize? bottom;
  final bool pinned;
  final bool floating;
  final bool snap;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: leading ??
          InkWell(
            onTap: () => scaffoldKey.currentState?.openDrawer(),
            child: const Icon(Icons.menu_outlined),
          ),
      pinned: pinned,
      floating: floating,
      snap: snap,
      expandedHeight: 60.0,
      centerTitle: true,
      title: CustomText(
        title,
        fontSize: AppFontSize.titleMediumFont,
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.center,
      ),
      flexibleSpace: const FlexibleSpaceBar(
        expandedTitleScale: 1.1,
        centerTitle: true,
      ),
      actions: [action ?? const SizedBox.shrink()],
      bottom: bottom,
    );
  }
}
