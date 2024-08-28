import 'package:equatable/equatable.dart';

import '../../../../widgets/add_signature_widgets/pen_tools.dart';

/// [AddSignatureEvent]
abstract class AddSignatureEvent extends Equatable {
  const AddSignatureEvent();

  @override
  List<Object?> get props => [];
}

/// [OnSignatureSelectionEvent]
class OnSignatureSelectionEvent extends AddSignatureEvent {
  final int selectedSign;

  const OnSignatureSelectionEvent({required this.selectedSign});

  @override
  List<Object?> get props => [selectedSign];
}

/// [OnPenStrokeSelectionEvent]
class OnPenStrokeSelectionEvent extends AddSignatureEvent {
  final PenStroke penStroke;

  const OnPenStrokeSelectionEvent({required this.penStroke});

  @override
  List<Object?> get props => [penStroke];
}

/// [OnPenColorSelectionEvent]
class OnPenColorSelectionEvent extends AddSignatureEvent {
  final PenColors penColor;

  const OnPenColorSelectionEvent({required this.penColor});

  @override
  List<Object?> get props => [penColor];
}
