import 'package:equatable/equatable.dart';

import '../../request_signature/widgets/add_signature_widgets/pen_tools.dart';

/// [SignatureManagerState]
abstract class SignatureManagerState extends Equatable {
  const SignatureManagerState();

  @override
  List<Object?> get props => [];
}

/// [SignatureInitialState]
class AddSignatureInitial extends SignatureManagerState {
  const AddSignatureInitial();
}

/// [OnSignatureSelectedState]
class OnSignatureSelectedState extends SignatureManagerState {
  final int selectedSignature;

  const OnSignatureSelectedState({required this.selectedSignature});

  @override
  List<Object?> get props => [selectedSignature];
}

/// [OnPenStrokeSelectionState]
class OnPenStrokeSelectionState extends SignatureManagerState {
  final PenStroke selectedStroke;

  const OnPenStrokeSelectionState({required this.selectedStroke});

  @override
  List<Object?> get props => [selectedStroke];
}

/// [OnPenColorSelectionState]
class OnPenColorSelectionState extends SignatureManagerState {
  final PenColors selectedColor;

  const OnPenColorSelectionState({required this.selectedColor});

  @override
  List<Object?> get props => [selectedColor];
}
