import 'package:flutter/material.dart';

import '../../../../domain/consts/consts.dart';

class CustomFolderTile extends StatelessWidget {
  final int index;
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  const CustomFolderTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: SizedBox(
        height: 80,
        child: Container(
          decoration: BoxDecoration(
            color: color.surface,
            backgroundBlendMode: BlendMode.dstIn,
            boxShadow: [
              BoxShadow(
                color: color.shadow,
                blurRadius: 6,
                spreadRadius: 1,
              )
            ],
            borderRadius: BorderRadius.circular(AppStyle.tileBorderRadius),
          ),
          child: ListTile(
            onTap: () {},
            contentPadding: const EdgeInsets.all(15),
            leading: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: AppFontSize.bodyLargeFont,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: AppFontSize.labelSmallFont,
                    color: color.outline,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
