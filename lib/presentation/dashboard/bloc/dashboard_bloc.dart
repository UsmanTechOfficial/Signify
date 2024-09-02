import 'package:dyno_sign/domain/custom_widgets/bottomSheets/base_bottom_sheet.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/custom_widgets/bottomSheets/add_sign_sheets/sign_request_sheet.dart';
import '../views/home/home_view.dart';

part '../views/agreements_view.dart';

part '../views/profile.dart';

part '../views/templates_view.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState>
    with BaseBottomSheet {
  ///[] Constructor
  DashboardBloc() : super(const DashboardInitialState()) {
    /// on [DashboardPageChangedEvent] Event handler for page change
    on<DashboardPageChangedEvent>((event, emit) {
      emit(DashboardPageChangeState(newIndex: event.index));
    });

    /// [DrawerTabChangeEvent] Event handler for drawer tab change
    on<DrawerTabChangeEvent>((event, emit) {
      emit(DrawerTabChangeState(newIndex: event.index));
    });
  }

  final int selectedPage = 0;

  ///[] Show sign request sheet
  void showSignRequestSheet(BuildContext context) {
    baseBottomSheet(
      context,
      content: const SignRequestSheet(),
      title: 'Add',
    );
  }
}

enum SelectDocTypes {
  scan,
  camera,
  templates,
  gallery,
  drive,
  files,
  library,
  media,
}

enum DrawerTabs {
  home("Home", "assets/icons/ic_home_outlined.svg"),
  templates("Templates", "assets/icons/ic_home_outlined.svg"),
  agreements("Agreements", "assets/icons/ic_home_outlined.svg"),
  profile("Profile", "assets/icons/ic_home_outlined.svg"),
  folder("FolderS", "assets/icons/ic_home_outlined.svg"),
  setting("Settings", "assets/icons/ic_home_outlined.svg");

  final String tab;
  final String icon;

  const DrawerTabs(this.tab, this.icon);
}
