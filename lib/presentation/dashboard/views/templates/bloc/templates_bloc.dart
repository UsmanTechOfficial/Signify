import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'templates_event.dart';

part 'templates_state.dart';

class TemplatesBloc extends Bloc<TemplatesEvent, TemplatesState> {
  TemplatesBloc() : super(const TemplatesInitialState()) {
    /// [SearchTemplatesEvent]
    on<SearchTemplatesEvent>((event, emit) async {
      emit(const SearchLoadingState());
      await Future.delayed(const Duration(seconds: 2));

      final results = ["Template 1", "Template 2", "Template 3"]
          .where((template) =>
              template.toLowerCase().contains(event.query.toLowerCase()))
          .toList();

      if (results.isNotEmpty) {
        emit(SearchLoadedState(results));
      } else {
        emit(const SearchErrorState("No results found"));
      }
    });
  }
}

enum StatusFilters {
  all('All Agreements'),
  onlyForMe('Only for me'),
  sendOther('Send by others'),
  waitingOther('Waiting for others'),
  completed('Completed'),
  receiveCopy('Receive a copy'),
  draft('Draft'),
  cancelled('Cancelled'),
  downloads('Downloads');

  final String label;

  const StatusFilters(this.label);
}

enum DateFilters {
  all('All Agreements'),
  last12Mon('Last 12 Months'),
  last6Mon('Last 06 Months'),
  last30Day('Last 30 Days'),
  lastWeek('Last Week'),
  last24H('Last 24 Hours');

  final String label;

  const DateFilters(this.label);
}
