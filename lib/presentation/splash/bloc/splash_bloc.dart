import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/db/shared_preference/first_time_marker.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState.initial) {
    on<CheckUserStatus>(_onCheckUserStatus);
  }

  Future<void> _onCheckUserStatus(CheckUserStatus event, Emitter<SplashState> emit) async {
    final bool isNewUser = FirstTimeService.isFirstTime();

    await Future.delayed(const Duration(seconds: 1));
    if (isNewUser) {
      emit(SplashState.newUser);
    } else {
      emit(SplashState.returningUser);
    }
  }
}
