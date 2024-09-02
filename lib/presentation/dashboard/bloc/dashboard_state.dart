part of 'dashboard_bloc.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

class DashboardInitialState extends DashboardState {
  final int currentIndex;

  const DashboardInitialState({
    this.currentIndex = 0,
  });

  @override
  List<Object?> get props => [currentIndex];
}

class DashboardPageChangeState extends DashboardState {
  final int newIndex;

  const DashboardPageChangeState({
    required this.newIndex,
  });

  @override
  List<Object?> get props => [newIndex];

  copyWith({
    int? newIndex,
    List<Widget>? pages,
  }) {
    return DashboardPageChangeState(
      newIndex: newIndex ?? this.newIndex,
    );
  }
}

class DrawerTabChangeState extends DashboardState {
  final int newIndex;

  const DrawerTabChangeState({
    required this.newIndex,
  });

  @override
  List<Object?> get props => [newIndex];
}

const List<Widget> pageList = <Widget>[
  HomeView(),
  TemplatesView(),
  AgreementsView(),
  ProfileView(),
];
