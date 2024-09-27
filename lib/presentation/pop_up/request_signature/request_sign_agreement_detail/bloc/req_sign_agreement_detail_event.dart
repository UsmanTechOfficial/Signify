part of 'req_sign_agreement_detail_bloc.dart';

sealed class ReqSignAgreementDetailEvent extends Equatable {
  const ReqSignAgreementDetailEvent();

  @override
  List<Object> get props => [];
}

class RecipientRoleChangedEvent extends ReqSignAgreementDetailEvent {
  final RecipientUserRole newRole;

  const RecipientRoleChangedEvent(this.newRole);

  @override
  List<Object> get props => [newRole];
}

class NextNavigateEvent extends ReqSignAgreementDetailEvent {
  final RecipientUserRole currentRole;

  const NextNavigateEvent(this.currentRole);

  @override
  List<Object> get props => [currentRole];
}
