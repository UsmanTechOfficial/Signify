import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/utils/utils.dart';
import '../../../../../infrastructure/dal/models/picked_file.model.dart';

part 'req_sign_selected_doc_event.dart';
part 'req_sign_selected_doc_state.dart';

List<PickedFileModel> selectedPdfFileList = [];

class ReqSignSelectedDocBloc
    extends Bloc<ReqSignSelectedDocEvent, ReqSignSelectedDocState> {
  ReqSignSelectedDocBloc() : super(const ReqSignSelectedDocInitial()) {
    on<AddNewFileEvent>((event, emit) => _addNewFile(emit, state));
    on<RemoveFileEvent>((event, emit) => _removeFile(event.index, emit, state));
  }

  void _addNewFile(Emitter<ReqSignSelectedDocState> emit,
      ReqSignSelectedDocState currentState) async {
    final selectedFile = await FilePicker.pick();

    if (selectedFile.isNotEmpty) {
      try {
        final List<PickedFileModel> updatedList = List.from(
          (currentState is FileSelectedState)
              ? currentState.selectedPdfFileList
              : [],
        );

        for (var file in selectedFile) {
          final model = await FileToModel.convert(file);
          updatedList.add(model);
          selectedPdfFileList.add(model);

          log('File added: ${model.name}');
        }

        emit(FileSelectedState(updatedList)); // Emit updated list through state
      } catch (e) {
        log(e.toString());
      }
    }
  }

  void _removeFile(int index, Emitter<ReqSignSelectedDocState> emit,
      ReqSignSelectedDocState currentState) {
    if (currentState is FileSelectedState) {
      final updatedList =
          List<PickedFileModel>.from(currentState.selectedPdfFileList);
      updatedList.removeAt(index);
      selectedPdfFileList.removeAt(index);

      emit(FileSelectedState(updatedList)); // Emit updated list after removal
    }
  }

  @override
  Future<void> close() {
    selectedPdfFileList.clear();
    return super.close();
  }
}
