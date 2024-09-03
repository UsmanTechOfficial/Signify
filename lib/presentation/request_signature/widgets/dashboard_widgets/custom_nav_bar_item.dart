import 'package:flutter/material.dart';

import '../../../../domain/consts/global_var.dart';

class CustomNavBarItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String label;
  final Widget icon;
  final Widget activeIcon;

  const CustomNavBarItem({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.label,
    required this.icon,
    required this.activeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: appWidth(context) * 0.2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 24, end: isSelected ? 30 : 24),
              duration: const Duration(milliseconds: 200),
              builder: (context, size, child) {
                return IconTheme(
                  data: IconThemeData(
                    size: size,
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                  child: isSelected ? activeIcon : icon,
                );
              },
            ),
            const SizedBox(height: 5),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 12, end: isSelected ? 14 : 12),
              duration: const Duration(milliseconds: 200),
              builder: (context, size, child) {
                return Text(
                  label,
                  style: TextStyle(
                    fontSize: size,
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
