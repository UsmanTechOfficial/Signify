import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../assets_gen/assets.gen.dart';
import '../../../domain/consts/consts.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentPage;
  final ValueChanged<int> onChange;

  const CustomBottomNavBar({
    super.key,
    required this.currentPage,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomNavBarItem(
                  isSelected: currentPage == 0,
                  onTap: () => onChange(0),
                  label: 'Home',
                  icon: Assets.icons.icHomeOutlined.svg(),
                  activeIcon: Assets.icons.icHomeFilled.svg(),
                ),
                CustomNavBarItem(
                  isSelected: currentPage == 1,
                  onTap: () => onChange(1),
                  label: 'Template',
                  icon: Assets.icons.icTemplatesOutlined.svg(),
                  activeIcon: Assets.icons.icTemplatesFilled.svg(),
                ),
              ],
            ),
            Row(
              children: [
                CustomNavBarItem(
                  isSelected: currentPage == 2,
                  onTap: () => onChange(2),
                  label: 'Agreement',
                  icon: Assets.icons.icAgreementsOutlined.svg(),
                  activeIcon: Assets.icons.icAgreementsFilled.svg(),
                ),
                CustomNavBarItem(
                  isSelected: currentPage == 3,
                  onTap: () => onChange(3),
                  label: 'Profile',
                  icon: Assets.icons.icProfileOutlined.svg(),
                  activeIcon: Assets.icons.icProfileFilled.svg(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
    return InkResponse(
      overlayColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      splashColor: Theme.of(context).primaryColor.withOpacity(0.2),
      // Better visual feedback
      highlightColor: Colors.transparent,
      // Remove default highlight color
      child: SizedBox(
        width: appWidth(context) * 0.2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildIcon(context),
            const SizedBox(height: 5),
            _buildLabel(context),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 24, end: isSelected ? 30 : 24),
      duration: const Duration(milliseconds: 200),
      builder: (context, size, child) {
        return IconTheme(
          data: IconThemeData(
            size: size,
            color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
          ),
          child: isSelected ? activeIcon : icon,
        );
      },
    );
  }

  Widget _buildLabel(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 12, end: isSelected ? 14 : 12),
      duration: const Duration(milliseconds: 200),
      builder: (context, size, child) {
        return Text(
          label,
          style: TextStyle(
            fontSize: size,
            color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
          ),
        );
      },
    );
  }
}
