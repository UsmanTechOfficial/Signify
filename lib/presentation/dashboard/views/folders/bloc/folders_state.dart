part of '../bloc/folders_bloc.dart';

sealed class FoldersState extends Equatable {
  const FoldersState();

  @override
  List<Object?> get props => [];
}

final class FoldersInitialState extends FoldersState {
  const FoldersInitialState();

  @override
  List<Object?> get props => [];
}

final class SearchLoadingState extends FoldersState {
  const SearchLoadingState();

  @override
  List<Object?> get props => [];
}

final class SearchErrorState extends FoldersState {
  final String message;

  const SearchErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

final class SearchLoadedState extends FoldersState {
  final List<String> result;

  const SearchLoadedState(this.result);

  @override
  List<Object?> get props => [result];
}

final class StatusFilterSelectionState extends FoldersState {
  final StatusFilters newFilter;

  const StatusFilterSelectionState(this.newFilter);

  @override
  List<Object?> get props => [newFilter];
}

final class DateFilterSelectionState extends FoldersState {
  final DateFilters newFilter;

  const DateFilterSelectionState(this.newFilter);

  @override
  List<Object?> get props => [newFilter];
}

final class CreateFolderState extends FoldersState {
  final FolderModel folder;

  const CreateFolderState(this.folder);

  @override
  List<Object?> get props => [folder];
}