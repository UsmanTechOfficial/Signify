import 'package:equatable/equatable.dart';

abstract class AgreementDetailAddedEvent extends Equatable {
  const AgreementDetailAddedEvent();

  @override
  List<Object?> get props => [];
}

class UpdateAgreementName extends AgreementDetailAddedEvent {
  final String agreementName;

  const UpdateAgreementName(this.agreementName);

  @override
  List<Object?> get props => [agreementName];
}

class UpdateDescription extends AgreementDetailAddedEvent {
  final String description;

  const UpdateDescription(this.description);

  @override
  List<Object?> get props => [description];
}

class SelectRole extends AgreementDetailAddedEvent {
  final int selectedRoleIndex;

  const SelectRole(this.selectedRoleIndex);

  @override
  List<Object?> get props => [selectedRoleIndex];
}

class UpdateRecipientName extends AgreementDetailAddedEvent {
  final String recipientName;

  const UpdateRecipientName(this.recipientName);

  @override
  List<Object?> get props => [recipientName];
}

class UpdateRecipientEmail extends AgreementDetailAddedEvent {
  final String recipientEmail;

  const UpdateRecipientEmail(this.recipientEmail);

  @override
  List<Object?> get props => [recipientEmail];
}

class SubmitAgreement extends AgreementDetailAddedEvent {
  const SubmitAgreement();

  @override
  List<Object?> get props => [];
}
