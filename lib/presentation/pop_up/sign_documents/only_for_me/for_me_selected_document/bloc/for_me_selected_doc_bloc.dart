import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../domain/utils/utils.dart';
import '../../../../../../infrastructure/dal/models/selected_file.model.dart';

part 'for_me_selected_doc_event.dart';
part 'for_me_selected_doc_state.dart';

List<SelectedFileModel> forMeSelectedPdfFileList = [];

class ForMeSelectedDocBloc
    extends Bloc<ForMeSelectedDocEvent, ForMeSelectedDocState> {
  ForMeSelectedDocBloc() : super(const ReqSignSelectedDocInitial()) {
    on<AddNewFileEvent>((event, emit) => _addNewFile(emit, state));
    on<RemoveFileEvent>((event, emit) => _removeFile(event.index, emit, state));
  }

  void _addNewFile(Emitter<ForMeSelectedDocState> emit,
      ForMeSelectedDocState currentState) async {
    final selectedFile = await FilePicker.pick();

    if (selectedFile.isNotEmpty) {
      try {
        final List<SelectedFileModel> updatedList = List.from(
          (currentState is FileSelectedState)
              ? currentState.selectedPdfFileList
              : [],
        );

        for (var file in selectedFile) {
          final model = await FileToModel.convert(file);
          updatedList.add(model);
          forMeSelectedPdfFileList.add(model);

          log('File added: ${model.name}');
        }

        emit(FileSelectedState(updatedList)); // Emit updated list through state
      } catch (e) {
        log(e.toString());
      }
    }
  }

  void _removeFile(int index, Emitter<ForMeSelectedDocState> emit,
      ForMeSelectedDocState currentState) {
    if (currentState is FileSelectedState) {
      final updatedList =
          List<SelectedFileModel>.from(currentState.selectedPdfFileList);
      updatedList.removeAt(index);
      forMeSelectedPdfFileList.removeAt(index);

      emit(FileSelectedState(updatedList)); // Emit updated list after removal
    }
  }

  @override
  Future<void> close() {
    forMeSelectedPdfFileList.clear();
    return super.close();
  }
}
