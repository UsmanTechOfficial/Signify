part of 'req_sign_selected_doc_bloc.dart';

sealed class ReqSignSelectedDocEvent extends Equatable {
  const ReqSignSelectedDocEvent();

  @override
  List<Object> get props => [];
}

class AddNewFileEvent extends ReqSignSelectedDocEvent {
  const AddNewFileEvent();

  @override
  List<Object> get props => [];
}

class RemoveFileEvent extends ReqSignSelectedDocEvent {
  final int index;

  const RemoveFileEvent(this.index);

  @override
  List<Object> get props => [index];
}
