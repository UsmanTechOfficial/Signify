import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/consts/consts.dart';

part 'templates_event.dart';part 'templates_state.dart';

class TemplatesBloc extends Bloc<TemplatesEvent, TemplatesState> {
  StatusFilters selectedStatusFilter = StatusFilters.all;
  DateFilters selectedDateFilters = DateFilters.all;

  TemplatesBloc() : super(const TemplatesInitialState()) {
    /// [SearchTemplatesEvent]
    on<SearchTemplatesEvent>(
      (event, emit) async {
        emit(const SearchLoadingState());
        final results = await _fetchSearch(event);

        if (results.isNotEmpty) {
          emit(SearchLoadedState(results));
        } else {
          emit(const SearchErrorState("No results found"));
        }
      },
    );

    /// [StatusFilterSelectionEvent]
    on<StatusFilterSelectionEvent>(
      (event, emit) {
        emit(StatusFilterSelectionState(event.selectedFilter));
      },
    );

    /// [DateFilterSelectionEvent]
    on<DateFilterSelectionEvent>(
      (event, emit) {
        emit(DateFilterSelectionState(event.selectedFilter));
      },
    );
  }

  _fetchSearch(SearchTemplatesEvent event) async {
    await Future.delayed(const Duration(seconds: 1));

    return ["Template 1", "Template 2", "Template 3"]
        .where((template) => template.toLowerCase().contains(event.query.toLowerCase()))
        .toList();
  }
}
