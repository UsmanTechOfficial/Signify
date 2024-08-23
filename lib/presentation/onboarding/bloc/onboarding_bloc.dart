import 'package:dyno_sign/assets_gen/assets.gen.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/db/shared_preference/first_time_marker.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final PageController pageController = PageController();

  OnboardingBloc() : super(const InitialState()) {
    on<PageChangedEvent>(_onPageChanged);
    on<NextPageEvent>(_onNextPage);
    on<PreviousPageEvent>(_onPreviousPage);
    on<SkipEvent>(_onSkip);
  }

  void _onPageChanged(PageChangedEvent event, Emitter<OnboardingState> emit) {
    emit(OnPageChanged(event.page));
  }

  void _onNextPage(NextPageEvent event, Emitter<OnboardingState> emit) {
    if (_isLastPage()) {
      _navigate();
    } else {
      emit(OnPageChanged(state.page + 1));
    }
  }

  void _onPreviousPage(PreviousPageEvent event, Emitter<OnboardingState> emit) {
    if (!_isFirstPage()) {
      emit(OnPageChanged(state.page - 1));
    }
  }

  void _onSkip(SkipEvent event, Emitter<OnboardingState> emit) {
    _navigate();
  }

  bool _isLastPage() => state.page >= 2;

  bool _isFirstPage() => state.page <= 0;

  void _navigate() {
    Go.offAllToNamed(Routes.DASHBOARD);
  }

  List<Widget> tabImages = [
    Assets.images.onBoardImg.image(),
    Assets.images.onBoardImg.image(),
    Assets.images.onBoardImg.image(),
  ];

  List<String> tabLabels = [
    'Page 1',
    'Page 2',
    'Page 3',
  ];

  @override
  Future<void> close() {
    FirstTimeService.markAsOpened();
    pageController.dispose();
    return super.close();
  }
}
