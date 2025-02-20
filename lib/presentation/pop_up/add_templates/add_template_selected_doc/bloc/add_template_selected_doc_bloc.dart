import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/utils/utils.dart';
import '../../../../../infrastructure/dal/models/selected_file.model.dart';

part 'add_template_selected_doc_event.dart';
part 'add_template_selected_doc_state.dart';

List<SelectedFileModel> addTemplateSelectedPdfFileList = [];

class AddTemplateSelectedDocBloc
    extends Bloc<AddTemplateSelectedDocEvent, AddTemplateSelectedDocState> {
  AddTemplateSelectedDocBloc() : super(const AddTemplateSelectedDocInitial()) {
    on<AddNewFileEvent>((event, emit) => _addNewFile(emit, state));
    on<RemoveFileEvent>((event, emit) => _removeFile(event.index, emit, state));
  }

  void _addNewFile(
      Emitter<AddTemplateSelectedDocState> emit, AddTemplateSelectedDocState currentState) async {
    final selectedFile = await FilePicker.pick();

    if (selectedFile != null) {
      try {
        final List<SelectedFileModel> updatedList = List.from(
          (currentState is FileSelectedState) ? currentState.selectedPdfFileList : [],
        );

        for (var file in selectedFile) {
          final model = await FileToModel.convert(file);
          updatedList.add(model);
          addTemplateSelectedPdfFileList.add(model);
        }

        emit(FileSelectedState(updatedList)); // Emit updated list through state
      } catch (e) {
        print(e);
      }
    }
  }

  void _removeFile(int index, Emitter<AddTemplateSelectedDocState> emit,
      AddTemplateSelectedDocState currentState) {
    if (currentState is FileSelectedState) {
      final updatedList = List<SelectedFileModel>.from(currentState.selectedPdfFileList);
      updatedList.removeAt(index);
      addTemplateSelectedPdfFileList.removeAt(index);

      emit(FileSelectedState(updatedList)); // Emit updated list after removal
    }
  }
}
