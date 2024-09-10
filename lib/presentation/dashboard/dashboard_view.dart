import 'package:dyno_sign/domain/consts/global_var.dart';
import 'package:dyno_sign/domain/consts/styles.dart';
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
import 'package:dyno_sign/presentation/signing_process/bloc/signing_process_cubit.dart';
import 'package:dyno_sign/presentation/signing_process/document_preview_view.01.dart';
import 'package:dyno_sign/presentation/widgets/bottom_sheets/bottom_sheets.dart';
import 'package:dyno_sign/presentation/widgets/bottom_sheets/custom_bottom_sheet/sheets_widget/add_documents/add_document.sheet.dart';
import 'package:dyno_sign/presentation/widgets/bottom_sheets/custom_bottom_sheet/sheets_widget/sign_selection/sign_selection.sheet.dart';
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

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HomeBloc>()),
        BlocProvider(create: (context) => getIt<TemplatesBloc>()),
        BlocProvider(create: (context) => getIt<AgreementsBloc>()),
        BlocProvider(create: (context) => getIt<ProfileBloc>()),
      ],
      child: BlocBuilder<DashboardBloc, DashboardState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          int currentPage = _getCurrentPage(state);

          return Scaffold(
            resizeToAvoidBottomInset: false,
            key: scaffoldKey,
            drawer: _buildDrawer(width, color, bloc),

            /// [Body]
            body: IndexedStack(
              index: currentPage,
              children: const [
                HomeView(),
                TemplatesView(),
                AgreementsView(),
                ProfileView(),
              ],
            ),

            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

            /// [FloatingActionButton]
            floatingActionButton: FloatingActionButton(
              elevation: 10,
              onPressed: () => _bottomSheet(context),
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(Icons.add, color: Theme.of(context).colorScheme.surface),
            ),

            /// [BottomNavigationBar]
            bottomNavigationBar: _buildBottomNavigationBar(bloc, currentPage),
          );
        },
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
                      borderRadius: BorderRadius.circular(AppStyle.buttonBorderRadius),
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

  void _navigateToNewPage(int index) {
    if (index == 4) Go.toNamed(Routes.FOLDERS);
    if (index == 5) Go.toNamed(Routes.SETTINGS);
  }

  void _bottomSheet(BuildContext context) {
    CustomModelSheet.showBottomSheet(
      context: context,
      title: "Add",
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildRequestSignatureTile(context),
          _buildSignDocumentsTile(context),
          _buildAddTemplatesTile(),
        ],
      ),
    );
  }

// Separate method for "Request Signature" tile
  Widget _buildRequestSignatureTile(BuildContext context) {
    return CustomBottomSheetTile(
      isSelected: false,
      title: "Request Signature",
      subtitle: 'Request anyone to add signatures in your document',
      onTap: () {
        Go.back();
        _showAddDocumentSheet(context);
      },
    );
  }

// Separate method for "Sign Documents" tile
  Widget _buildSignDocumentsTile(BuildContext context) {
    return CustomBottomSheetTile(
      isSelected: false,
      title: "Sign Documents",
      subtitle: 'Documents that you want to sign for yourself or sent by others',
      onTap: () {
        Go.back();
        _showSignSelectionSheet(context);
      },
    );
  }

// Separate method for "Add Templates" tile
  Widget _buildAddTemplatesTile() {
    return CustomBottomSheetTile(
      isSelected: false,
      title: "Add Templates",
      subtitle: 'Make templates and use them again and again.',
      onTap: () {
        // Logic for Add Templates
      },
    );
  }

// Method to show the Add Document Sheet
  void _showAddDocumentSheet(BuildContext context) {
    final cubit = getIt<SigningProcessCubit>();
    CustomModelSheet.showBottomSheet(
      context: context,
      title: "Add a Document",
      content: AddDocumentSheet(
        onTap: (source) async {
          Go.back();

          switch (source) {
            case DocumentSource.files:
              {
                await cubit.pickFiles();
                Go.toNamed(Routes.DOCUMENT_PREVIEW, arguments: cubit);
              }
            default:
              break;
          }
        },
      ),
    );
  }

// Method to show the Sign Selected Sheet
  void _showSignSelectionSheet(BuildContext context) {
    CustomModelSheet.showBottomSheet(
      context: context,
      title: "Sign",
      content: SignSelectedSheet(
        onForMe: () {
          // close previous sheet
          Go.back();
          _showAddDocumentSheet(context);
        },
        onByOthers: () {
          // close previous sheet
          Go.back();
          // Handle "Sign by Others" action
        },
      ),
    );
  }
}
