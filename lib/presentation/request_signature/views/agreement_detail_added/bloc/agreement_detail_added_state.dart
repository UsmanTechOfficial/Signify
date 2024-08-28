import 'package:equatable/equatable.dart';

class AgreementDetailAddedState extends Equatable {
  final String agreementName;
  final String description;
  final int selectedRoleIndex;
  final String recipientName;
  final String recipientEmail;
  final bool isSubmitted;

  const AgreementDetailAddedState({
    this.agreementName = '',
    this.description = '',
    this.selectedRoleIndex = 0,
    this.recipientName = '',
    this.recipientEmail = '',
    this.isSubmitted = false,
  });

  AgreementDetailAddedState copyWith({
    String? agreementName,
    String? description,
    int? selectedRoleIndex,
    String? recipientName,
    String? recipientEmail,
    bool? isSubmitted,
  }) {
    return AgreementDetailAddedState(
      agreementName: agreementName ?? this.agreementName,
      description: description ?? this.description,
      selectedRoleIndex: selectedRoleIndex ?? this.selectedRoleIndex,
      recipientName: recipientName ?? this.recipientName,
      recipientEmail: recipientEmail ?? this.recipientEmail,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }

  @override
  List<Object?> get props => [
        agreementName,
        description,
        selectedRoleIndex,
        recipientName,
        recipientEmail,
        isSubmitted,
      ];
}
