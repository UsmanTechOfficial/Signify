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

  List<RecipientModel> recipientList = [];
  List<DocumentUserModel> signerList = [];

  ReqSignUserDetailBloc(this.dataRepository) : super(const ReqSignRecipientDetailInitial()) {
    on<AddNewSingerEvent>(_addNewUser);
    on<RemoveSignerEvent>(_removeUser);
    on<UserOrderEvent>(_setOrder);
    on<AddNewViewerEvent>(_addNewViewer);
    on<RemoveViewerEvent>(_removeViewer);
    on<IncludeMeEvent>(_includeMe);
    on<NextNavigateEvent>(_nextNavigation);
  }

  FutureOr<void> _addNewUser(AddNewSingerEvent event, Emitter<ReqSignUserDetailState> emit) async {
    signerList = List<DocumentUserModel>.from(signerList)..add(event.signedUser);
    emit(
      SignerChangedState(List<DocumentUserModel>.from(signerList), false),
    );
  }

  FutureOr<void> _removeUser(RemoveSignerEvent event, Emitter<ReqSignUserDetailState> emit) {
    signerList = List<DocumentUserModel>.from(signerList)..removeAt(event.index);
    emit(
      SignerChangedState(List<DocumentUserModel>.from(signerList), false),
    );
  }

  FutureOr<void> _addNewViewer(AddNewViewerEvent event, Emitter<ReqSignUserDetailState> emit) {
    recipientList = List<RecipientModel>.from(recipientList)..add(event.viewer);
    emit(
      ViewerChangedState(List<RecipientModel>.from(recipientList)),
    );
  }

  FutureOr<void> _removeViewer(RemoveViewerEvent event, Emitter<ReqSignUserDetailState> emit) {
    recipientList = List<RecipientModel>.from(recipientList)..removeAt(event.index);
    emit(
      ViewerChangedState(List<RecipientModel>.from(recipientList)),
    );
  }

  FutureOr<void> _setOrder(UserOrderEvent event, Emitter<ReqSignUserDetailState> emit) {
    final currentState = state is SignerChangedState
        ? state as SignerChangedState
        : const SignerChangedState([], false);

    emit(
      SignerChangedState(currentState.signedUser, event.setOrder),
    );
  }

  FutureOr<void> _nextNavigation(NextNavigateEvent event, Emitter<ReqSignUserDetailState> emit) {
    if (signerList.isNotEmpty) {
      dataRepository.updateDocumentUsers(signerList);
      dataRepository.updateRecipients(recipientList);
      Go.toNamed(Routes.REQ_SIGN_ASSIGN_FIELDS);
    } else {
      CSnackBar.show('No signer added yet');
    }
  }

  FutureOr<void> _includeMe(IncludeMeEvent event, Emitter<ReqSignUserDetailState> emit) {
    emit(OnIncludeMeState(event.included));
    signerList = List.from(signerList)
      ..insert(
          0,
          DocumentUserModel(
              email: 'email', firstName: 'firstName', signingOrder: 0, status: 'status'));

    emit(SignerChangedState(List.from(signerList), false));
  }
}
