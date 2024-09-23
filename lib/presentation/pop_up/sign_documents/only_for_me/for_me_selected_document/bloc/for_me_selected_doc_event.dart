part of 'for_me_selected_doc_bloc.dart';

sealed class ForMeSelectedDocEvent extends Equatable {
  const ForMeSelectedDocEvent();

  @override
  List<Object> get props => [];
}

class AddNewFileEvent extends ForMeSelectedDocEvent {
  const AddNewFileEvent();

  @override
  List<Object> get props => [];
}

class RemoveFileEvent extends ForMeSelectedDocEvent {
  final int index;

  const RemoveFileEvent(this.index);

  @override
  List<Object> get props => [index];
}
