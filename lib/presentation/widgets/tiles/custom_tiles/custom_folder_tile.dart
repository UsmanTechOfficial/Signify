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
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          height: 80,
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
