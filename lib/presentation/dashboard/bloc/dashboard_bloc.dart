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
  DashboardBloc() : super(const DashboardInitialState()) {
    on<DashboardPageChangedEvent>(
      (event, emit) {
        emit(state.copyWith(currentIndex: event.index));
      },
    );
  }

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
