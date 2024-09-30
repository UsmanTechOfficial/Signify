import 'dart:async';

import 'package:dyno_sign/infrastructure/dal/models/api_models/document_user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/dal/services/data_models_repository/req_sign_doc_data_repository.dart';

part 'req_sign_user_detail_event.dart';
part 'req_sign_user_detail_state.dart';

class ReqSignUserDetailBloc extends Bloc<ReqSignUserDetailEvent, ReqSignUserDetailState> {
  final ReqSignDocumentRepository dataRepository;

  ReqSignUserDetailBloc(this.dataRepository) : super(const ReqSignRecipientDetailInitial()) {
    on<AddNewSingedUserEvent>(_addNewRecipient);
    on<UserOrderEvent>(_setOrder);
  }

  FutureOr<void> _addNewRecipient(
      AddNewSingedUserEvent event, Emitter<ReqSignUserDetailState> emit) {
    final currentState =
        state is UserAddedState ? state as UserAddedState : const UserAddedState([], false);

    final user = List<DocumentUserModel>.from(currentState.signedUser)..add(event.signedUser);

    emit(currentState.copyWith(signedUser: user));
  }

  FutureOr<void> _setOrder(UserOrderEvent event, Emitter<ReqSignUserDetailState> emit) {
    final currentState =
        state is UserAddedState ? state as UserAddedState : const UserAddedState([], false);

    final s = currentState.copyWith(order: event.setOrder);

    emit(currentState.copyWith(order: event.setOrder));
  }
}
