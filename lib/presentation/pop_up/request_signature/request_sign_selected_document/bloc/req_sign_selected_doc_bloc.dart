import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/utils/utils.dart';
import '../../../../../infrastructure/dal/models/picked_file.model.dart';

part 'req_sign_selected_doc_event.dart';
part 'req_sign_selected_doc_state.dart';

class ReqSignSelectedDocBloc
    extends Bloc<ReqSignSelectedDocEvent, ReqSignSelectedDocState> {
  List<PickedFileModel> selectedPdfFileList = [];

  ReqSignSelectedDocBloc() : super(ReqSignSelectedDocInitial()) {
    on<AddNewFileEvent>((event, emit) => _addNewFile(emit));
    on<RemoveFileEvent>((event, emit) => _removeFile(event.index, emit));
  }

  void _addNewFile(Emitter<ReqSignSelectedDocState> emit) async {
    final selectedFile = await FilePicker.pick();

    try {
      if (selectedFile.length == 1) {
        final model = await FileToModel.convert(selectedFile.first);
        selectedPdfFileList.add(model);
      } else {
        for (var file in selectedFile) {
          final model = await FileToModel.convert(file);
          selectedPdfFileList.add(model);
        }
      }

      emit(const FileSelectedState());
    } catch (e) {
      log(e.toString());
    }
  }

  void _removeFile(int index, Emitter<ReqSignSelectedDocState> emit) {
    selectedPdfFileList.removeAt(index);
    emit(const FileSelectedState());
  }

  @override
  Future<void> close() {
    print("ReqSignSelectedDocBloc closed");
    return super.close();
  }
}
