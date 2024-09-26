part of 'req_sign_selected_doc_bloc.dart';

sealed class ReqSignSelectedDocEvent extends Equatable {
  const ReqSignSelectedDocEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends ReqSignSelectedDocEvent {
  final List<SelectedFileModel> files;

  const InitialEvent(this.files);

  @override
  List<Object> get props => [files];
}

class AddNewFileEvent extends ReqSignSelectedDocEvent {
  const AddNewFileEvent();
}

class RemoveFileEvent extends ReqSignSelectedDocEvent {
  final int index;

  const RemoveFileEvent(this.index);

  @override
  List<Object> get props => [index];
}

class NextNavigateEvent extends ReqSignSelectedDocEvent {
  const NextNavigateEvent();
}
