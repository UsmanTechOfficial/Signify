import 'package:dyno_sign/domain/core/usecases/agreements/get_all_agreements_usecase.dart';
import 'package:dyno_sign/infrastructure/dal/models/docs_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/consts/app_consts/filters.dart';

part 'agreements_event.dart';
part 'agreements_state.dart';

class AgreementsBloc extends Bloc<AgreementsEvent, AgreementsState> {
  StatusFilters selectedStatusFilter = StatusFilters.all;
  DateFilters selectedDateFilters = DateFilters.all;

  GetAllAgreementsUseCase getAllAgreementsUseCase;

  AgreementsBloc(this.getAllAgreementsUseCase) : super(const AgreementsInitialState()) {
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

    on<GetAllAgreementsEvent>(_fetchAgreements);
  }

  _fetchAgreements(GetAllAgreementsEvent event, Emitter<AgreementsState> emit) async {
    try {
      emit(AgreementsLoadingState());
      var allItems = await getAllAgreementsUseCase.execute();
      emit(AgreementsLoadedState(data: allItems));
    } catch (e) {
      emit(AgreementsErrorState(errorMessage: e.toString()));
    }
  }

  _fetchSearch(SearchAgreementsEvent event) async {
    await Future.delayed(const Duration(seconds: 1));

    return ["Agreement 1", "Agreement 2", "Agreement 3"]
        .where((agreement) => agreement.toLowerCase().contains(event.query.toLowerCase()))
        .toList();
  }

  @override
  void onChange(Change<AgreementsState> change) {
    super.onChange(change);
  }
}
