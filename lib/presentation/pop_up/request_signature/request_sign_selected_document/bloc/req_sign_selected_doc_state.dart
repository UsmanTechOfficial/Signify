part of 'req_sign_selected_doc_bloc.dart';

sealed class ReqSignSelectedDocState extends Equatable {
  const ReqSignSelectedDocState();

  @override
  List<Object> get props => [];
}

final class ReqSignSelectedDocInitial extends ReqSignSelectedDocState {}

class FileSelectedState extends ReqSignSelectedDocState {
  // final List<PickedFileModel> selectedFiles;

  const FileSelectedState();

// @override
// List<Object> get props => [selectedFiles];
}
