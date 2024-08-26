part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final int currentIndex;
  final List<Widget> pageList;

  const DashboardState({
    this.currentIndex = 0,
    required this.pageList,
  });

  DashboardState copyWith({
    int? currentIndex,
  }) {
    return DashboardState(
      currentIndex: currentIndex ?? this.currentIndex,
      pageList: pageList,
    );
  }

  @override
  List<Object> get props => [currentIndex, pageList];
}
