part of 'dashboard_bloc.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitialState extends DashboardState {
  const DashboardInitialState();
}

class PageChangedState extends DashboardState {
  final int currentIndex;

  const PageChangedState(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}
