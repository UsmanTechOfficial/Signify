part of 'req_sign_agreement_detail_bloc.dart';

sealed class ReqSignAgreementDetailState extends Equatable {
  const ReqSignAgreementDetailState();

  @override
  List<Object> get props => [];
}

final class ReqSignAgreementDetailInitial extends ReqSignAgreementDetailState {}

class RecipientRoleState extends ReqSignAgreementDetailState {
  final RecipientUserRole selectedRole;

  const RecipientRoleState(this.selectedRole);

  @override
  List<Object> get props => [selectedRole];
}
