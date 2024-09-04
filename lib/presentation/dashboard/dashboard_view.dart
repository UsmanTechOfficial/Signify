import 'package:dyno_sign/domain/consts/global_var.dart';
import 'package:dyno_sign/domain/consts/styles.dart';
import 'package:dyno_sign/infrastructure/dal/doas/agreements/agreements_dao.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/routes.dart';
import 'package:dyno_sign/presentation/dashboard/views/agreements/agreements_view.dart';
import 'package:dyno_sign/presentation/dashboard/views/agreements/bloc/agreements_bloc.dart';
import 'package:dyno_sign/presentation/dashboard/views/home/bloc/home_bloc.dart';
import 'package:dyno_sign/presentation/dashboard/views/home/home_view.dart';
import 'package:dyno_sign/presentation/dashboard/views/profile/bloc/profile_bloc.dart';
import 'package:dyno_sign/presentation/dashboard/views/profile/profile_view.dart';
import 'package:dyno_sign/presentation/dashboard/views/templates/bloc/templates_bloc.dart';
import 'package:dyno_sign/presentation/dashboard/views/templates/templates_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../assets_gen/assets.gen.dart';

import '../request_signature/widgets/dashboard_widgets/custom_nav_bar_item.dart';
import '../request_signature/widgets/dashboard_widgets/drawer_items_tile.dart';
import 'bloc/dashboard_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DashboardBloc>();
    final color = appColorScheme(context);
    final width = appWidth(context);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AgreementsRepository>(
          create: (context) => AgreementsRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeBloc()),
          BlocProvider(create: (context) => TemplatesBloc()),
          BlocProvider(
              create: (context) => AgreementsBloc(
                    RepositoryProvider.of<AgreementsRepository>(context),
                  )),
          BlocProvider(create: (context) => ProfileBloc()),
        ],
        child: BlocBuilder<DashboardBloc, DashboardState>(
          buildWhen: (previous, current) => previous != current,
          // Rebuild only when the state actually changes
          builder: (context, state) {
            int currentPage = _getCurrentPage(state);

            return Scaffold(
              resizeToAvoidBottomInset: false,
              key: scaffoldKey,
              drawer: _buildDrawer(width, color, bloc),
              body: IndexedStack(
                index: currentPage,
                children: const [
                  HomeView(),
                  TemplatesView(),
                  AgreementsView(),
                  ProfileView(),
                ],
              ),
              bottomNavigationBar: _buildBottomNavigationBar(bloc, currentPage),
              floatingActionButton: _buildFAB(context, bloc),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            );
          },
        ),
      ),
    );
  }

  int _getCurrentPage(DashboardState state) {
    if (state is DashboardPageChangeState) {
      return state.newIndex;
    } else if (state is DashboardInitialState) {
      return state.currentIndex;
    }
    return 0;
  }

  Widget _buildDrawer(double width, ColorScheme color, DashboardBloc bloc) {
    return Drawer(
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
                      borderRadius:
                          BorderRadius.circular(AppStyle.buttonBorderRadius),
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
          Column(
            children: DrawerTabs.values.map((tab) {
              return BlocBuilder<DashboardBloc, DashboardState>(
                buildWhen: (p, current) => current is DashboardPageChangeState,
                builder: (context, state) {
                  int selectedTab = 0;

                  if (state is DashboardPageChangeState) {
                    selectedTab = state.newIndex;
                  } else if (state is DashboardInitialState) {
                    selectedTab = state.currentIndex;
                  }

                  return DrawerItemsTile(
                    isSelected: selectedTab == tab.index,
                    title: tab.label,
                    icon: tab.iconPath,
                    onTap: () {
                      scaffoldKey.currentState?.closeDrawer();
                      selectedTab = tab.index;
                      if (tab.index < 4) {
                        bloc.add(DashboardPageChangedEvent(selectedTab));
                      } else {
                        _navigateToNewPage(tab.index);
                      }
                    },
                  );
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(DashboardBloc bloc, int currentPage) {
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
                  onTap: () {
                    if (currentPage != 0) {
                      bloc.add(const DashboardPageChangedEvent(0));
                    }
                  },
                  label: 'Home',
                  icon: Assets.icons.icHomeOutlined.svg(),
                  activeIcon: Assets.icons.icHomeFilled.svg(),
                ),
                CustomNavBarItem(
                  isSelected: currentPage == 1,
                  onTap: () {
                    if (currentPage != 1) {
                      bloc.add(const DashboardPageChangedEvent(1));
                    }
                  },
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
                  onTap: () {
                    if (currentPage != 2) {
                      bloc.add(const DashboardPageChangedEvent(2));
                    }
                  },
                  label: 'Agreement',
                  icon: Assets.icons.icAgreementsOutlined.svg(),
                  activeIcon: Assets.icons.icAgreementsFilled.svg(),
                ),
                CustomNavBarItem(
                  isSelected: currentPage == 3,
                  onTap: () {
                    if (currentPage != 3) {
                      bloc.add(const DashboardPageChangedEvent(3));
                    }
                  },
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

  Widget _buildFAB(BuildContext context, DashboardBloc bloc) {
    return FloatingActionButton(
      elevation: 10,
      onPressed: () => bloc.showSignRequestSheet(context),
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.add, color: Theme.of(context).colorScheme.surface),
    );
  }

  void _navigateToNewPage(int index) {
    if (index == 4) Go.toNamed(Routes.PROFILE);
    if (index == 5) Go.toNamed(Routes.SETTINGS);
  }
}
