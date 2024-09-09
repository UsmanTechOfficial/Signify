import 'package:equatable/equatable.dart';

import '../../request_signature/widgets/add_signature_widgets/pen_tools.dart';

/// [SignatureManagerEvent]
abstract class SignatureManagerEvent extends Equatable {
  const SignatureManagerEvent();

  @override
  List<Object?> get props => [];
}

/// [OnSignatureSelectionEvent]
class OnSignatureSelectionEvent extends SignatureManagerEvent {
  final int selectedSign;

  const OnSignatureSelectionEvent({required this.selectedSign});

  @override
  List<Object?> get props => [selectedSign];
}

/// [OnPenStrokeSelectionEvent]
class OnPenStrokeSelectionEvent extends SignatureManagerEvent {
  final PenStroke penStroke;

  const OnPenStrokeSelectionEvent({required this.penStroke});

  @override
  List<Object?> get props => [penStroke];
}

/// [OnPenColorSelectionEvent]
class OnPenColorSelectionEvent extends SignatureManagerEvent {
  final PenColors penColor;

  const OnPenColorSelectionEvent({required this.penColor});

  @override
  List<Object?> get props => [penColor];
}
