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

final class StatusFilterSelectionEvent extends TemplatesEvent {
  final StatusFilters selectedFilter;

  const StatusFilterSelectionEvent(this.selectedFilter);

  @override
  List<Object> get props => [selectedFilter];
}

final class DateFilterSelectionEvent extends TemplatesEvent {
  final DateFilters selectedFilter;

  const DateFilterSelectionEvent(this.selectedFilter);

  @override
  List<Object> get props => [selectedFilter];
}
