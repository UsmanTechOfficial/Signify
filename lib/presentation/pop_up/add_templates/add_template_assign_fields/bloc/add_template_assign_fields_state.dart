part of 'add_template_assign_fields_bloc.dart';

sealed class AddTemplateAssignFieldsState extends Equatable {
  const AddTemplateAssignFieldsState();

  @override
  List<Object> get props => [];
}

final class AddTemplateAssignFieldsInitial extends AddTemplateAssignFieldsState {
  const AddTemplateAssignFieldsInitial();
}

final class DocumentPreviewLoading extends AddTemplateAssignFieldsState {}

final class DocumentPreviewLoaded extends AddTemplateAssignFieldsState {
  final Uint8List imageBytes;

  const DocumentPreviewLoaded(this.imageBytes);

  @override
  List<Object> get props => [imageBytes];
}

final class DocumentPreviewError extends AddTemplateAssignFieldsState {
  final String msg;

  const DocumentPreviewError(this.msg);

  @override
  List<Object> get props => [msg];
}

final class AssignFieldSelectedDoc extends AddTemplateAssignFieldsState {
  final int index;

  const AssignFieldSelectedDoc(this.index);

  @override
  List<Object> get props => [index];
}
