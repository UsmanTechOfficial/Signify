part of 'agreements_bloc.dart';

sealed class AgreementsState extends Equatable {
  const AgreementsState();

  @override
  List<Object?> get props => [];
}

final class AgreementsInitialState extends AgreementsState {
  const AgreementsInitialState();

  @override
  List<Object?> get props => [];
}

final class AgreementsLoadingState extends AgreementsState {
  @override
  List<Object?> get props => [];
}

final class AgreementsLoadedState extends AgreementsState {
  final List<DocsModel> data;

  const AgreementsLoadedState({required this.data});

  @override
  List<Object?> get props => [data];
}

final class AgreementsErrorState extends AgreementsState {
  final String errorMessage;

  const AgreementsErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

final class SearchState extends AgreementsState {
  final List<DocsModel> result;
  final String searchText;

  const SearchState({this.searchText = '', this.result = const []});

  @override
  List<Object?> get props => [result, searchText];
}

final class StatusFilterSelectionState extends AgreementsState {
  final StatusFilters newFilter;

  const StatusFilterSelectionState(this.newFilter);

  @override
  List<Object?> get props => [newFilter];
}

final class DateFilterSelectionState extends AgreementsState {
  final DateFilters newFilter;

  const DateFilterSelectionState(this.newFilter);

  @override
  List<Object?> get props => [newFilter];
}
