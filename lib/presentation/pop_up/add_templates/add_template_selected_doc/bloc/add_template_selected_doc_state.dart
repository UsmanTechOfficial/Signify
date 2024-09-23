part of 'add_template_selected_doc_bloc.dart';

sealed class AddTemplateSelectedDocState extends Equatable {
  const AddTemplateSelectedDocState();

  @override
  List<Object> get props => [];
}

final class AddTemplateSelectedDocInitial extends AddTemplateSelectedDocState {
  const AddTemplateSelectedDocInitial();
}

class FileSelectedState extends AddTemplateSelectedDocState {
  final List<PickedFileModel> selectedPdfFileList;

  const FileSelectedState(this.selectedPdfFileList);

  @override
  List<Object> get props => [selectedPdfFileList];
}
