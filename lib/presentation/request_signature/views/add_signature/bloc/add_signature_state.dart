import 'package:equatable/equatable.dart';

class AddSignatureState extends Equatable {
  final int selectedSignature;

  const AddSignatureState({required this.selectedSignature});

  copyWith({int? selectedSignature}) {
    return AddSignatureState(
        selectedSignature: selectedSignature ?? this.selectedSignature);
  }

  @override
  List<Object?> get props => [selectedSignature];
}

class AddSignatureInitial extends AddSignatureState {
  const AddSignatureInitial({super.selectedSignature = -1});
}

class OnSignatureSelectedState extends AddSignatureState {
  const OnSignatureSelectedState({required super.selectedSignature});

  @override
  copyWith({int? selectedSignature}) {
    return OnSignatureSelectedState(
      selectedSignature: selectedSignature ?? this.selectedSignature,
    );
  }
}
