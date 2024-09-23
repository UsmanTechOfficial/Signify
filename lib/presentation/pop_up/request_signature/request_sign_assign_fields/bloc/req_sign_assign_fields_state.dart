part of 'req_sign_assign_fields_bloc.dart';

sealed class ReqSignAssignFieldsState extends Equatable {
  const ReqSignAssignFieldsState();

  @override
  List<Object> get props => [];
}

final class ReqSignAssignFieldsInitial extends ReqSignAssignFieldsState {}

final class DocumentPreviewLoading extends ReqSignAssignFieldsState {}

final class DocumentPreviewLoaded extends ReqSignAssignFieldsState {
  final Uint8List imageBytes;

  const DocumentPreviewLoaded(this.imageBytes);

  @override
  List<Object> get props => [imageBytes];
}

final class DocumentPreviewError extends ReqSignAssignFieldsState {
  final String msg;

  const DocumentPreviewError(this.msg);

  @override
  List<Object> get props => [msg];
}

final class AssignFieldSelectedDoc extends ReqSignAssignFieldsState {
  final int index;

  const AssignFieldSelectedDoc(this.index);

  @override
  List<Object> get props => [index];
}
