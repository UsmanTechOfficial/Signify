import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../assets_gen/assets.gen.dart';
import 'bloc/dashboard_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return state.pageList[state.currentIndex];
        },
      ),
      bottomNavigationBar: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return BottomAppBar(
            height: 85,
            shape: const CircularNotchedRectangle(),
            notchMargin: 6.0,
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Assets.icons.icHomeOutlined.svg(),
                  activeIcon: Assets.icons.icHomeFilled.svg(),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Assets.icons.icTemplatesOutlined.svg(),
                  activeIcon: Assets.icons.icTemplatesFilled.svg(),
                  label: 'Templates',
                ),
                BottomNavigationBarItem(
                  icon: Assets.icons.icAgreementsOutlined.svg(),
                  activeIcon: Assets.icons.icAgreementsFilled.svg(),
                  label: 'Agreements',
                ),
                BottomNavigationBarItem(
                  icon: Assets.icons.icProfileOutlined.svg(),
                  activeIcon: Assets.icons.icProfileFilled.svg(),
                  label: 'Profile',
                ),
              ],
              currentIndex: state.currentIndex,
              onTap: (index) {
                context.read<DashboardBloc>().add(PageChanged(index));
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {
          context.read<DashboardBloc>().add(AddSignRequest(context));
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.surface),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
