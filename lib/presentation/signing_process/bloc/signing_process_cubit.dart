import 'dart:typed_data';

import 'package:dyno_sign/domain/consts/extention_methods.dart';
import 'package:dyno_sign/domain/utils/utils.dart';
import 'package:dyno_sign/infrastructure/dal/models/docs_model.dart';
import 'package:dyno_sign/infrastructure/dal/models/picked_file.model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signing_process_state.dart';

class SigningProcessCubit extends Cubit<SigningProcessState> {
  List<PickedFileModel> pickedFiles = [];

  SigningProcessCubit() : super(const SigningProcessInitialState());

  void documentPreview() async {
    emit(DocumentPreviewLoading());

    try {
      for (var file in pickedFiles) {
        final firstPage = await PdfSinglePage.get(file.xFile);
        final imageBytes = firstPage?.bytes;

        if (imageBytes != null) {
          emit(DocumentPreviewLoaded(imageBytes));
        }
      }
    } catch (e) {
      emit(DocumentPreviewError(e.toString()));
    }
  }

  void addNewFile() async {
    final selectedFile = await FilePicker.pick();

    if (selectedFile.length == 1) {
      final model = await FileToModel.convert(selectedFile.first);
      pickedFiles.add(model);
    } else {
      for (var file in selectedFile) {
        final model = await FileToModel.convert(file);
        pickedFiles.add(model);
      }
    }

    emit(FileSelectedState(files: List.unmodifiable(pickedFiles)));
  }

  void removeFile(int index) {
    pickedFiles.removeAt(index);
    emit(FileSelectedState(files: List.unmodifiable(pickedFiles)));
  }
}
