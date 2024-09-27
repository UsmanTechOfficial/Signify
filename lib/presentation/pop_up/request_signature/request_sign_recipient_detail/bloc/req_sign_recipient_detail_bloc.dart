import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/dal/services/data_models_repository/req_sign_doc_data_repository.dart';

part 'req_sign_recipient_detail_event.dart';
part 'req_sign_recipient_detail_state.dart';

class ReqSignRecipientDetailBloc
    extends Bloc<ReqSignRecipientDetailEvent, ReqSignRecipientDetailState> {
  final ReqSignDocDataRepository dataRepository;

  ReqSignRecipientDetailBloc(this.dataRepository) : super(const ReqSignRecipientDetailInitial()) {
    on<AddNewRecipientEvent>(_addNewRecipient);
    on<RecipientOrderEvent>(_setOrder);
  }

  FutureOr<void> _addNewRecipient(
      AddNewRecipientEvent event, Emitter<ReqSignRecipientDetailState> emit) {
    final currentState = state is RecipientAddedState
        ? state as RecipientAddedState
        : const RecipientAddedState([], false);

    // final updatedRecipients = List<String>.from(currentState.recipientList)
    //   ..addAll(event.recipients);

    emit(currentState.copyWith(recipientList: event.recipients));
  }

  FutureOr<void> _setOrder(RecipientOrderEvent event, Emitter<ReqSignRecipientDetailState> emit) {
    final currentState = state is RecipientAddedState
        ? state as RecipientAddedState
        : const RecipientAddedState([], false);

    emit(currentState.copyWith(order: event.setOrder));
  }
}
