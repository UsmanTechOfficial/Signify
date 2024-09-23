part of 'req_sign_assign_fields_bloc.dart';

sealed class ReqSignAssignFieldsEvent extends Equatable {
  const ReqSignAssignFieldsEvent();

  @override
  List<Object> get props => [];
}

class DocumentPreviewRequested extends ReqSignAssignFieldsEvent {
  const DocumentPreviewRequested();

  @override
  List<Object> get props => [];
}

class DocumentSelected extends ReqSignAssignFieldsEvent {
  final int index;

  const DocumentSelected(this.index);

  @override
  List<Object> get props => [index];
}
