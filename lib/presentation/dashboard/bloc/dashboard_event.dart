part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
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

class DrawerTabChangeEvent extends DashboardEvent {
  final int index;

  const DrawerTabChangeEvent(this.index);

  @override
  List<Object> get props => [index];
}
