part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int selectedTileIndex;
  final int selectedCategoryIndex;
  final int selectedDocIndex;

  const HomeState({
    this.selectedTileIndex = -1,
    this.selectedCategoryIndex = -1,
    this.selectedDocIndex = -1,
  });

  HomeState copyWith({
    int? selectedTileIndex,
    int? selectedCategoryIndex,
    int? selectedDocIndex,
  }) {
    return HomeState(
      selectedTileIndex: selectedTileIndex ?? this.selectedTileIndex,
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      selectedDocIndex: selectedDocIndex ?? this.selectedDocIndex,
    );
  }

  @override
  List<Object?> get props => [
        selectedTileIndex,
        selectedCategoryIndex,
        selectedDocIndex,
      ];
}
