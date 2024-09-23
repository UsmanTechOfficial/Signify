part of 'for_me_selected_doc_bloc.dart';

sealed class ForMeSelectedDocState extends Equatable {
  const ForMeSelectedDocState();

  @override
  List<Object> get props => [];
}

final class ReqSignSelectedDocInitial extends ForMeSelectedDocState {
  const ReqSignSelectedDocInitial();
}

class FileSelectedState extends ForMeSelectedDocState {
  final List<PickedFileModel> selectedPdfFileList;

  const FileSelectedState(this.selectedPdfFileList);

  @override
  List<Object> get props => [selectedPdfFileList];
}
