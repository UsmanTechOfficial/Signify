part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class PageChanged extends DashboardEvent {
  final int index;

  const PageChanged(this.index);

  @override
  List<Object> get props => [index];
}

class AddSignRequest extends DashboardEvent {
  final BuildContext context;

  const AddSignRequest(this.context);

  @override
  List<Object> get props => [context];
}
