import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../views/agreements_view.dart';
part '../views/home_view.dart';
part '../views/profile.dart';
part '../views/templates_view.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc()
      : super(const DashboardState(
          pageList: [
            HomeView(),
            TemplatesView(),
            AgreementsView(),
            ProfileView(),
          ],
        )) {
    on<PageChanged>((event, emit) {
      emit(state.copyWith(currentIndex: event.index));
    });

    on<AddSignRequest>((event, emit) {
      _showSignRequestSheet(event.context);
    });
  }

  void _showSignRequestSheet(BuildContext context) {
    // showModalBottomSheet(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return const SignRequestSheet();
    //   },
    // );
  }
}
