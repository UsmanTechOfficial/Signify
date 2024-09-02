import 'package:dyno_sign/domain/consts/font_size.dart';
import 'package:dyno_sign/domain/consts/global_var.dart';
import 'package:dyno_sign/domain/consts/styles.dart';
import 'package:dyno_sign/domain/custom_widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../assets_gen/assets.gen.dart';
import 'bloc/dashboard_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = appWidth(context);
    final bloc = context.read<DashboardBloc>();
    final color = appColorScheme(context);

    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        width: width * 0.75,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DrawerHeader(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Assets.images.splashImg.image(
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppStyle.buttonBorderRadius,
                        ),
                      ),
                      backgroundColor: color.outlineVariant.withOpacity(0.5),
                    ),
                    onPressed: () {
                      scaffoldKey.currentState?.closeDrawer();
                    },
                    icon: Assets.icons.moreIcon.svg(color: color.primary),
                  ),
                ],
              ),
            ),
            BlocBuilder<DashboardBloc, DashboardState>(
              buildWhen: (previous, current) =>
                  current is DashboardPageChangeState ||
                  current is DrawerTabChangeState,
              builder: (context, state) {
                final bloc = context.read<DashboardBloc>();

                final int currentIndex = state is DashboardPageChangeState
                    ? state.newIndex
                    : state is DrawerTabChangeState
                        ? state.newIndex
                        : 0;

                return Column(
                  children: List.generate(
                    DrawerTabs.values.length,
                    (index) => SettingListTile(
                      isSelected: index == currentIndex,
                      title: DrawerTabs.values[index].tab,
                      icon: DrawerTabs.values[index].icon,
                      onTap: () {
                        bloc.add(DrawerTabChangeEvent(index));
                        scaffoldKey.currentState?.closeDrawer();
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        buildWhen: (previous, current) =>
            current is DashboardPageChangeState ||
            current is DrawerTabChangeState,
        builder: (_, state) {
          int currentIndex;

          if (state is DashboardInitialState) {
            currentIndex = state.currentIndex;
          } else if (state is DashboardPageChangeState) {
            currentIndex = state.newIndex;
          } else if (state is DrawerTabChangeState) {
            currentIndex = state.newIndex;
          } else {
            currentIndex = 0; // Fallback to the first page if state is unknown
          }

          return pageList[currentIndex];
        },
      ),
      bottomNavigationBar: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          final currentIndex =
              state is DashboardPageChangeState ? state.newIndex : 0;
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
                        isSelected: currentIndex == 0,
                        onTap: () =>
                            bloc.add(const DashboardPageChangedEvent(0)),
                        label: 'Home',
                        icon: Assets.icons.icHomeOutlined.svg(),
                        activeIcon: Assets.icons.icHomeFilled.svg(),
                      ),
                      CustomNavItem(
                        isSelected: currentIndex == 1,
                        onTap: () =>
                            bloc.add(const DashboardPageChangedEvent(1)),
                        label: 'Template',
                        icon: Assets.icons.icTemplatesOutlined.svg(),
                        activeIcon: Assets.icons.icTemplatesFilled.svg(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomNavItem(
                        isSelected: currentIndex == 2,
                        onTap: () =>
                            bloc.add(const DashboardPageChangedEvent(2)),
                        label: 'Agreement',
                        icon: Assets.icons.icAgreementsOutlined.svg(),
                        activeIcon: Assets.icons.icAgreementsFilled.svg(),
                      ),
                      CustomNavItem(
                        isSelected: currentIndex == 3,
                        onTap: () =>
                            bloc.add(const DashboardPageChangedEvent(3)),
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

class SettingListTile extends StatelessWidget {
  final bool isSelected;
  final VoidCallback? onTap;
  final String title;
  final String icon;

  const SettingListTile({
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
      leading: SvgGenImage(icon)
          .svg(color: isSelected ? color.surface : color.onSurface),
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
