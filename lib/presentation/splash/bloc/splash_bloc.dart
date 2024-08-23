import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/db/shared_preference/first_time_marker.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState.initial) {
    on<CheckUserStatus>(_onCheckUserStatus);
  }

  void _onCheckUserStatus(CheckUserStatus event, Emitter<SplashState> emit) {
    final bool isNewUser = FirstTimeService.isFirstTime();
    if (isNewUser) {
      emit(SplashState.newUser);
    } else {
      emit(SplashState.returningUser);
    }
  }
}
