part of 'dashboard_bloc.dart';

sealed class DashboardState extends Equatable {
  final int currentIndex;
  final List<Widget> pages;

  const DashboardState({required this.currentIndex, required this.pages});

  copyWith({
    int? currentIndex,
  }) {}

  @override
  List<Object?> get props => [pages, currentIndex];
}

class DashboardInitialState extends DashboardState {
  const DashboardInitialState({
    super.currentIndex = 0,
    super.pages = pageList,
  });

  @override
  DashboardInitialState copyWith({int? currentIndex}) {
    return DashboardInitialState(
      currentIndex: currentIndex ?? this.currentIndex,
      pages: pageList,
    );
  }
}

const List<Widget> pageList = <Widget>[
  HomeView(),
  TemplatesView(),
  AgreementsView(),
  ProfileView(),
];
