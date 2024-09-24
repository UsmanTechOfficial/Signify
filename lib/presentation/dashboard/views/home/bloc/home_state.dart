part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {
  final int index;

  const HomeInitialState(this.index);
}

// class HomeTileSelectedState extends HomeState {
//   final int selectedTileIndex;
//
//   const HomeTileSelectedState({required this.selectedTileIndex});
//
//   HomeTileSelectedState copyWith({int? selectedTileIndex}) {
//     return HomeTileSelectedState(
//       selectedTileIndex: selectedTileIndex ?? this.selectedTileIndex,
//     );
//   }
//
//   @override
//   List<Object?> get props => [selectedTileIndex];
// }

class HomeCategorySelectedState extends HomeState {
  final int selectedCategoryIndex;

  const HomeCategorySelectedState({required this.selectedCategoryIndex});

  HomeCategorySelectedState copyWith({int? selectedCategoryIndex}) {
    return HomeCategorySelectedState(
      selectedCategoryIndex: selectedCategoryIndex ?? this.selectedCategoryIndex,
    );
  }

  @override
  List<Object?> get props => [selectedCategoryIndex];
}

class HomeDocSelectedState extends HomeState {
  final int selectedDocIndex;

  const HomeDocSelectedState({required this.selectedDocIndex});

  HomeDocSelectedState copyWith({int? selectedDocIndex}) {
    return HomeDocSelectedState(
      selectedDocIndex: selectedDocIndex ?? this.selectedDocIndex,
    );
  }

  @override
  List<Object?> get props => [selectedDocIndex];
}
