import 'package:equatable/equatable.dart';

sealed class OnboardingState extends Equatable {
  final int page;

  const OnboardingState(this.page);

  @override
  List<Object> get props => [page];
}

class InitialState extends OnboardingState {
  const InitialState() : super(0);
}

class OnPageChanged extends OnboardingState {
  const OnPageChanged(super.page);
}
