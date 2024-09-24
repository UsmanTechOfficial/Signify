part of 'req_sign_selected_doc_bloc.dart';

sealed class ReqSignSelectedDocState extends Equatable {
  const ReqSignSelectedDocState();

  @override
  List<Object> get props => [];
}

final class ReqSignSelectedDocInitial extends ReqSignSelectedDocState {
  const ReqSignSelectedDocInitial();
}

class FileSelectedState extends ReqSignSelectedDocState {
  final List<SelectedFileModel> selectedPdfFileList;

  const FileSelectedState(this.selectedPdfFileList);

  @override
  List<Object> get props => [selectedPdfFileList];
}
