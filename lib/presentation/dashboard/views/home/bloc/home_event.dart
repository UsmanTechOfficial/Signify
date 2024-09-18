part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

// class SelectTile extends HomeEvent {
//   final int index;
//
//   const SelectTile(this.index);
//
//   @override
//   List<Object?> get props => [index];
// }

class SelectCategory extends HomeEvent {
  final int index;

  const SelectCategory(this.index);

  @override
  List<Object?> get props => [index];
}

class SelectDoc extends HomeEvent {
  final int index;

  const SelectDoc(this.index);

  @override
  List<Object?> get props => [index];
}
