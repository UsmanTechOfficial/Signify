import 'package:equatable/equatable.dart';

sealed class AddSignatureEvent extends Equatable {
  final int selectedSign;

  const AddSignatureEvent({required this.selectedSign});

  @override
  List<Object?> get props => [selectedSign]; // Include selectedSign in props
}

class OnSignatureSelectionEvent extends AddSignatureEvent {
  const OnSignatureSelectionEvent({required super.selectedSign});

  @override
  List<Object?> get props => [selectedSign];
}
