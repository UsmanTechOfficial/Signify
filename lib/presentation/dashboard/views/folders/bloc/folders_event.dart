part of 'folders_bloc.dart';

sealed class FoldersEvent extends Equatable {
  const FoldersEvent();

  @override
  List<Object?> get props => [];
}

final class SearchFoldersEvent extends FoldersEvent {
  final String query;

  const SearchFoldersEvent(this.query);

  @override
  List<Object?> get props => [query];
}

final class StatusFilterSelectionEvent extends FoldersEvent {
  final StatusFilters selectedFilter;

  const StatusFilterSelectionEvent(this.selectedFilter);

  @override
  List<Object> get props => [selectedFilter];
}

final class DateFilterSelectionEvent extends FoldersEvent {
  final DateFilters selectedFilter;

  const DateFilterSelectionEvent(this.selectedFilter);

  @override
  List<Object> get props => [selectedFilter];
}

final class OnNewFolderEvent extends FoldersEvent {
  final NewFolderModel folderName;

  const OnNewFolderEvent(this.folderName);

  @override
  List<Object?> get props => [folderName];
}
