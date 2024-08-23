import 'package:equatable/equatable.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class PageChangedEvent extends OnboardingEvent {
  final int page;

  const PageChangedEvent(this.page);

  @override
  List<Object> get props => [page];
}

class NextPageEvent extends OnboardingEvent {}

class PreviousPageEvent extends OnboardingEvent {}

class SkipEvent extends OnboardingEvent {}
