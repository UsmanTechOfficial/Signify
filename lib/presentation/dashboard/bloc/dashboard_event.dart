part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class PageChangEvent extends DashboardEvent {
  final int index;

  const PageChangEvent(this.index);

  @override
  List<Object> get props => [index];
}
