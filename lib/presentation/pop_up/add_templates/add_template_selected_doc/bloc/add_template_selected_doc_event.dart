part of 'add_template_selected_doc_bloc.dart';

sealed class AddTemplateSelectedDocEvent extends Equatable {
  const AddTemplateSelectedDocEvent();

  @override
  List<Object> get props => [];
}

class AddNewFileEvent extends AddTemplateSelectedDocEvent {
  const AddNewFileEvent();

  @override
  List<Object> get props => [];
}

class RemoveFileEvent extends AddTemplateSelectedDocEvent {
  final int index;

  const RemoveFileEvent(this.index);

  @override
  List<Object> get props => [index];
}
