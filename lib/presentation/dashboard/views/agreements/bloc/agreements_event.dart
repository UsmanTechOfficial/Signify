part of 'agreements_bloc.dart';

sealed class AgreementsEvent extends Equatable {
  const AgreementsEvent();

  @override
  List<Object?> get props => [];
}

final class GetAllAgreementsEvent extends AgreementsEvent {}

final class SearchAgreementsEvent extends AgreementsEvent {
  final String query;

  const SearchAgreementsEvent(this.query);

  @override
  List<Object?> get props => [query];
}

final class StatusFilterSelectionEvent extends AgreementsEvent {
  final StatusFilters selectedFilter;

  const StatusFilterSelectionEvent(this.selectedFilter);

  @override
  List<Object> get props => [selectedFilter];
}

final class DateFilterSelectionEvent extends AgreementsEvent {
  final DateFilters selectedFilter;

  const DateFilterSelectionEvent(this.selectedFilter);

  @override
  List<Object> get props => [selectedFilter];
}
