import 'dart:async';

import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/routes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/consts/consts.dart';
import '../../../../../infrastructure/dal/services/data_models_repository/req_sign_doc_data_repository.dart';

part 'req_sign_agreement_detail_event.dart';
part 'req_sign_agreement_detail_state.dart';

class ReqSignAgreementDetailBloc
    extends Bloc<ReqSignAgreementDetailEvent, ReqSignAgreementDetailState> {
  final ReqSignDocDataRepository dataRepository;

  final TextEditingController agreementNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final FocusNode agreementNameFocus = FocusNode();
  final FocusNode descriptionFocus = FocusNode();

  ReqSignAgreementDetailBloc(this.dataRepository) : super(ReqSignAgreementDetailInitial()) {
    on<RecipientRoleChangedEvent>(_changeRecipientRole);
    on<NextNavigateEvent>(_nextNavigation);
  }

  FutureOr<void> _changeRecipientRole(
      RecipientRoleChangedEvent event, Emitter<ReqSignAgreementDetailState> emit) {
    emit(RecipientRoleState(event.newRole));
  }

  @override
  Future<void> close() {
    // Dispose of controllers when Bloc is closed
    agreementNameController.dispose();
    descriptionController.dispose();
    agreementNameFocus.dispose();
    descriptionFocus.dispose();
    return super.close();
  }

  FutureOr<void> _nextNavigation(
      NextNavigateEvent event, Emitter<ReqSignAgreementDetailState> emit) {
    Go.toNamed(Routes.REQ_SIGN_RECIPIENT_DETAIL, arguments: event.currentRole);
  }
}
