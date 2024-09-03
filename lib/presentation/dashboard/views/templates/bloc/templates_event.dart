part of '../bloc/templates_bloc.dart';

sealed class TemplatesEvent extends Equatable {
  const TemplatesEvent();

  @override
  List<Object?> get props => [];
}

final class SearchTemplatesEvent extends TemplatesEvent {
  final String query;

  const SearchTemplatesEvent(this.query);

  @override
  List<Object?> get props => [query];
}
