part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class DashboardPageChangedEvent extends DashboardEvent {
  final int index;

  const DashboardPageChangedEvent(this.index);

  @override
  List<Object> get props => [index];
}
