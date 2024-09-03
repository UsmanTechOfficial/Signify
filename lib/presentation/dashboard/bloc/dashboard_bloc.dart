import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/bottomSheets/add_sign_sheets/sign_request_sheet.dart';
import '../../widgets/bottomSheets/base_bottom_sheet.dart';
import '../views/agreements/agreements_view.dart';
import '../views/agreements/bloc/agreements_bloc.dart';
import '../views/home/bloc/home_bloc.dart';
import '../views/home/home_view.dart';
import '../views/profile/bloc/profile_bloc.dart';
import '../views/profile/profile_view.dart';
import '../views/templates/bloc/templates_bloc.dart';
import '../views/templates/templates_view.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState>
    with BaseBottomSheet {
  DashboardBloc() : super(const DashboardInitialState()) {
    on<DashboardPageChangedEvent>((event, emit) {
      emit(DashboardPageChangeState(newIndex: event.index));
    });
  }

  void showSignRequestSheet(BuildContext context) {
    baseBottomSheet(
      context,
      content: const SignRequestSheet(),
      title: 'Add',
    );
  }
}

List<Widget> pageList = <Widget>[
  BlocProvider<HomeBloc>(
    create: (context) => HomeBloc(),
    child: const HomeView(),
  ),
  BlocProvider<TemplatesBloc>(
    create: (context) => TemplatesBloc(),
    child: const TemplatesView(),
  ),
  BlocProvider<AgreementsBloc>(
    create: (context) => AgreementsBloc(),
    child: const AgreementsView(),
  ),
  BlocProvider<ProfileBloc>(
    create: (context) => ProfileBloc(),
    child: const ProfileView(),
  ),
];

enum DrawerTabs {
  home("Home", "assets/icons/ic_home_outlined.svg"),
  templates("Templates", "assets/icons/ic_templates_outlined.svg"),
  agreements("Agreements", "assets/icons/ic_agreements_outlined.svg"),
  profile("Profile", "assets/icons/ic_profile_outlined.svg"),
  folder("Folder", "assets/icons/ic_folder_outlined.svg"),
  setting("Settings", "assets/icons/ic_settings_outlined.svg");

  final String label;
  final String iconPath;

  const DrawerTabs(this.label, this.iconPath);
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
