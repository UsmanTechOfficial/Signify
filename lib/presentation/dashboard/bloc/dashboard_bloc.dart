import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardInitialState()) {
    on<DashboardPageChangedEvent>((event, emit) {
      // Only emit state if the new page index is different from the current one
      if (state is DashboardPageChangeState) {
        if ((state as DashboardPageChangeState).newIndex != event.index) {
          emit(DashboardPageChangeState(newIndex: event.index));
        }
      } else if (state is DashboardInitialState) {
        if ((state as DashboardInitialState).currentIndex != event.index) {
          emit(DashboardPageChangeState(newIndex: event.index));
        }
      }
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
