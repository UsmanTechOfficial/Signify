part of 'add_template_assign_fields_bloc.dart';

sealed class AddTemplateAssignFieldsEvent extends Equatable {
  const AddTemplateAssignFieldsEvent();

  @override
  List<Object> get props => [];
}

class DocumentPreviewRequested extends AddTemplateAssignFieldsEvent {
  const DocumentPreviewRequested();

  @override
  List<Object> get props => [];
}

class DocumentSelected extends AddTemplateAssignFieldsEvent {
  final int index;

  const DocumentSelected(this.index);

  @override
  List<Object> get props => [index];
}
