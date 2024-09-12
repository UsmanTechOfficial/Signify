import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  PageController pageController = PageController();

  DashboardBloc() : super(const DashboardInitialState()) {
    on<DashboardPageChangedEvent>((event, emit) {
      emit(DashboardPageChangeState(newIndex: event.index));
      pageController.jumpToPage(event.index);
    });
  }
}

enum DrawerTabs {
  home("Home", "assets/icons/ic_home_outlined.svg"),
  templates("Templates", "assets/icons/ic_templates_outlined.svg"),
  agreements("Agreements", "assets/icons/ic_agreements_outlined.svg"),
  profile("Profile", "assets/icons/ic_profile_outlined.svg"),
  folder("Folder", "assets/icons/ic_home_outlined.svg"),
  setting("Settings", "assets/icons/ic_home_outlined.svg");

  final String label;
  final String iconPath;

  const DrawerTabs(this.label, this.iconPath);
}
