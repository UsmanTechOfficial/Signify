import 'package:dyno_sign/domain/consts/global_var.dart';
import 'package:dyno_sign/domain/consts/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../assets_gen/assets.gen.dart';
import '../widgets/dashboard_widgets/custom_nav_bar_item.dart';
import '../widgets/dashboard_widgets/drawer_items_tile.dart';
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
      // drawer: Drawer(
      //   width: width * 0.75,
      //   child: Column(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       DrawerHeader(
      //         child: Row(
      //           mainAxisSize: MainAxisSize.max,
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Assets.images.splashImg.image(
      //               width: 150,
      //               fit: BoxFit.contain,
      //             ),
      //             IconButton(
      //               style: IconButton.styleFrom(
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(
      //                     AppStyle.buttonBorderRadius,
      //                   ),
      //                 ),
      //                 backgroundColor: color.outlineVariant.withOpacity(0.5),
      //               ),
      //               onPressed: () => scaffoldKey.currentState?.closeDrawer(),
      //               icon: Assets.icons.moreIcon.svg(color: color.primary),
      //             ),
      //           ],
      //         ),
      //       ),
      //       BlocBuilder<DashboardBloc, DashboardState>(
      //         buildWhen: (previous, current) =>
      //             current is DashboardPageChangeState,
      //         builder: (context, state) {
      //           return Column(
      //             children: DrawerTabs.values.map((tab) {
      //               return DrawerItemsTile(
      //                 isSelected: tab.index == bloc.currentPage,
      //                 title: tab.tab,
      //                 icon: tab.icon,
      //                 onTap: () {},
      //               );
      //             }).toList(),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        buildWhen: (previous, current) {
          return current is DashboardPageChangeState;
        },
        builder: (context, state) {
          if (state is DashboardPageChangeState) {
            bloc.currentPage = state.newIndex;
          }

          return pageList[bloc.currentPage];
        },
      ),
      bottomNavigationBar:
          BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
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
                      isSelected: bloc.currentPage == 0,
                      onTap: () => bloc.add(const DashboardPageChangedEvent(0)),
                      label: 'Home',
                      icon: Assets.icons.icHomeOutlined.svg(),
                      activeIcon: Assets.icons.icHomeFilled.svg(),
                    ),
                    CustomNavBarItem(
                      isSelected: bloc.currentPage == 1,
                      onTap: () => bloc.add(const DashboardPageChangedEvent(1)),
                      label: 'Template',
                      icon: Assets.icons.icTemplatesOutlined.svg(),
                      activeIcon: Assets.icons.icTemplatesFilled.svg(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomNavBarItem(
                      isSelected: bloc.currentPage == 2,
                      onTap: () => bloc.add(const DashboardPageChangedEvent(2)),
                      label: 'Agreement',
                      icon: Assets.icons.icAgreementsOutlined.svg(),
                      activeIcon: Assets.icons.icAgreementsFilled.svg(),
                    ),
                    CustomNavBarItem(
                      isSelected: bloc.currentPage == 3,
                      onTap: () => bloc.add(const DashboardPageChangedEvent(3)),
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
      }),
      floatingActionButton: _buildFAB(context, bloc),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildFAB(BuildContext context, DashboardBloc bloc) {
    return FloatingActionButton(
      elevation: 10,
      onPressed: () => bloc.showSignRequestSheet(context),
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.add, color: Theme.of(context).colorScheme.surface),
    );
  }
}
