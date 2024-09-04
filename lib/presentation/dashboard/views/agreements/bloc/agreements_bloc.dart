import 'package:dyno_sign/infrastructure/dal/doas/agreements/agreements_dao.dart';
import 'package:dyno_sign/infrastructure/dal/models/docs_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/filters.dart';

part 'agreements_event.dart';

part 'agreements_state.dart';

class AgreementsBloc extends Bloc<AgreementsEvent, AgreementsState> {
  StatusFilters selectedStatusFilter = StatusFilters.all;
  DateFilters selectedDateFilters = DateFilters.all;
  final List<DocsModel> allItems = [];

  final AgreementsRepository agreementsRepository;

  AgreementsBloc(this.agreementsRepository)
      : super(const AgreementsInitialState()) {
    /// [SearchAgreementsEvent]
    on<SearchAgreementsEvent>((event, emit) {
      final filteredItems = allItems.where((item) {
        return item.title.toLowerCase().contains(event.query.toLowerCase());
      }).toList();

      emit(SearchState(searchText: event.query, result: filteredItems));
    });

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

    on<GetAllAgreementsEvent>(
      (event, emit) async {
        emit(AgreementsLoadingState());
        try {
          final result = await agreementsRepository.getAllAgreements();
          if (result.isNotEmpty) {
            emit(AgreementsLoadedState(data: result));
          }
        } catch (e) {
          emit(const AgreementsErrorState(
              errorMessage: "something wents wrong"));
        }
      },
    );
  }

  _fetchSearch(SearchAgreementsEvent event) async {
    await Future.delayed(const Duration(seconds: 1));

    return ["Agreement 1", "Agreement 2", "Agreement 3"]
        .where((agreement) =>
            agreement.toLowerCase().contains(event.query.toLowerCase()))
        .toList();
  }
}
