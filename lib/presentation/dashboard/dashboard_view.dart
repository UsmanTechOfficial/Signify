import 'package:dyno_sign/domain/consts/global_var.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../assets_gen/assets.gen.dart';
import 'bloc/dashboard_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DashboardBloc>();

    return Scaffold(
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (_, state) {
          return state.pages[state.currentIndex];
        },
      ),
      bottomNavigationBar: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (_, state) {
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
                      CustomNavItem(
                        isSelected: bloc.state.currentIndex == 0 ? true : false,
                        onTap: () =>
                            bloc.add(const DashboardPageChangedEvent(0)),
                        label: 'Home',
                        icon: Assets.icons.icHomeOutlined.svg(),
                        activeIcon: Assets.icons.icHomeFilled.svg(),
                      ),
                      CustomNavItem(
                        onTap: () =>
                            bloc.add(const DashboardPageChangedEvent(1)),
                        isSelected: bloc.state.currentIndex == 1 ? true : false,
                        label: 'Template',
                        icon: Assets.icons.icTemplatesOutlined.svg(),
                        activeIcon: Assets.icons.icTemplatesFilled.svg(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomNavItem(
                        onTap: () =>
                            bloc.add(const DashboardPageChangedEvent(2)),
                        isSelected: bloc.state.currentIndex == 2 ? true : false,
                        label: 'Agreement',
                        icon: Assets.icons.icAgreementsOutlined.svg(),
                        activeIcon: Assets.icons.icAgreementsFilled.svg(),
                      ),
                      CustomNavItem(
                        onTap: () =>
                            bloc.add(const DashboardPageChangedEvent(3)),
                        isSelected: bloc.state.currentIndex == 3 ? true : false,
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
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {
          bloc.showSignRequestSheet(context);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.surface),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class CustomNavItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String label;
  final Widget icon;
  final Widget activeIcon;

  const CustomNavItem({
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
