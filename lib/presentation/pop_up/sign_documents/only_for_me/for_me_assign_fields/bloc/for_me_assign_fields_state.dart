part of 'for_me_assign_fields_bloc.dart';

sealed class ForMeAssignFieldsState extends Equatable {
  const ForMeAssignFieldsState();

  @override
  List<Object?> get props => [];
}

final class ForMeAssignFieldsInitial extends ForMeAssignFieldsState {
  const ForMeAssignFieldsInitial();
}

final class DocumentPreviewLoading extends ForMeAssignFieldsState {
  const DocumentPreviewLoading();
}

final class DocumentPreviewLoaded extends ForMeAssignFieldsState {
  final Uint8List imageBytes;

  const DocumentPreviewLoaded(this.imageBytes);

  @override
  List<Object> get props => [imageBytes];
}

final class DocumentPreviewError extends ForMeAssignFieldsState {
  final String msg;

  const DocumentPreviewError(this.msg);

  @override
  List<Object> get props => [msg];
}

final class AssignFieldSelectedDoc extends ForMeAssignFieldsState {
  final int index;

  const AssignFieldSelectedDoc(this.index);

  @override
  List<Object> get props => [index];
}
