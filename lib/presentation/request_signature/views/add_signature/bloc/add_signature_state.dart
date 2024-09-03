import 'package:equatable/equatable.dart';

import '../../../widgets/add_signature_widgets/pen_tools.dart';

/// [AddSignatureState]
abstract class AddSignatureState extends Equatable {
  const AddSignatureState();

  @override
  List<Object?> get props => [];
}

/// [SignatureInitialState]
class AddSignatureInitial extends AddSignatureState {
  const AddSignatureInitial();
}

/// [OnSignatureSelectedState]
class OnSignatureSelectedState extends AddSignatureState {
  final int selectedSignature;

  const OnSignatureSelectedState({required this.selectedSignature});

  @override
  List<Object?> get props => [selectedSignature];
}

/// [OnPenStrokeSelectionState]
class OnPenStrokeSelectionState extends AddSignatureState {
  final PenStroke selectedStroke;

  const OnPenStrokeSelectionState({required this.selectedStroke});

  @override
  List<Object?> get props => [selectedStroke];
}

/// [OnPenColorSelectionState]
class OnPenColorSelectionState extends AddSignatureState {
  final PenColors selectedColor;

  const OnPenColorSelectionState({required this.selectedColor});

  @override
  List<Object?> get props => [selectedColor];
}
