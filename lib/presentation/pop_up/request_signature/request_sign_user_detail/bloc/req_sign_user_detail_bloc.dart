import 'dart:async';

import 'package:dyno_sign/domain/utils/utils.dart';
import 'package:dyno_sign/infrastructure/dal/models/api_models/document_user_model.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/routes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/dal/models/api_models/recipinet_model.dart';
import '../../../../../infrastructure/dal/services/data_models_repository/req_sign_doc_data_repository.dart';

part 'req_sign_user_detail_event.dart';
part 'req_sign_user_detail_state.dart';

class ReqSignUserDetailBloc extends Bloc<ReqSignUserDetailEvent, ReqSignUserDetailState> {
  final ReqSignDocumentRepository dataRepository;

  ReqSignUserDetailBloc(this.dataRepository) : super(const ReqSignRecipientDetailInitial()) {
    on<AddNewSingerEvent>(_addNewUser);
    on<UserOrderEvent>(_setOrder);
    on<RemoveSignerEvent>(_removeUser);

    on<AddNewViewerEvent>(_addNewViewer);
    on<RemoveViewerEvent>(_removeViewer);

    on<NextNavigateEvent>(_nextNavigation);
  }

  FutureOr<void> _addNewUser(AddNewSingerEvent event, Emitter<ReqSignUserDetailState> emit) async {
    try {
      final currentState = state is SignerChangedState
          ? state as SignerChangedState
          : const SignerChangedState([], false);

      final user = List<DocumentUserModel>.from(currentState.signedUser)..add(event.signedUser);
      emit(currentState.copyWith(signedUser: user));
    } catch (e) {
      emit(UserErrorState('Failed to add user: $e'));
    }
  }

  FutureOr<void> _removeUser(RemoveSignerEvent event, Emitter<ReqSignUserDetailState> emit) {
    final currentState = state is SignerChangedState
        ? state as SignerChangedState
        : const SignerChangedState([], false);

    final user = List<DocumentUserModel>.from(currentState.signedUser)..removeAt(event.index);
    emit(currentState.copyWith(signedUser: user));
  }

  FutureOr<void> _addNewViewer(AddNewViewerEvent event, Emitter<ReqSignUserDetailState> emit) {
    try {
      final currentState =
          state is ViewerChangedState ? state as ViewerChangedState : const ViewerChangedState([]);

      final user = List<RecipientModel>.from(currentState.viewers)..add(event.viewer);
      emit(currentState.copyWith(viewers: user));
    } catch (e) {
      emit(UserErrorState('Failed to add viewer: $e'));
    }
  }

  FutureOr<void> _removeViewer(RemoveViewerEvent event, Emitter<ReqSignUserDetailState> emit) {}

  FutureOr<void> _setOrder(UserOrderEvent event, Emitter<ReqSignUserDetailState> emit) {
    final currentState = state is SignerChangedState
        ? state as SignerChangedState
        : const SignerChangedState([], false);

    emit(currentState.copyWith(order: event.setOrder));
  }

  FutureOr<void> _nextNavigation(NextNavigateEvent event, Emitter<ReqSignUserDetailState> emit) {
    final currentState = state is SignerChangedState
        ? state as SignerChangedState
        : const SignerChangedState([], false);

    if (currentState.signedUser.isNotEmpty) {
      dataRepository.updateDocumentUsers(currentState.signedUser);

      Go.toNamed(Routes.REQ_SIGN_ASSIGN_FIELDS);
    } else {
      CSnackBar.show('No signer added yet');
    }
  }
}
