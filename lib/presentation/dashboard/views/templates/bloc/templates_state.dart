part of '../bloc/templates_bloc.dart';

sealed class TemplatesState extends Equatable {
  const TemplatesState();

  @override
  List<Object?> get props => [];
}

final class TemplatesInitialState extends TemplatesState {
  const TemplatesInitialState();

  @override
  List<Object?> get props => [];
}

final class SearchLoadingState extends TemplatesState {
  const SearchLoadingState();

  @override
  List<Object?> get props => [];
}

final class SearchErrorState extends TemplatesState {
  final String message;

  const SearchErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

final class SearchLoadedState extends TemplatesState {
  final List<String> result;

  const SearchLoadedState(this.result);

  @override
  List<Object?> get props => [result];
}
