import 'dart:async';

import 'package:dyno_sign/domain/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/dal/models/selected_file.model.dart';
import '../../../../../infrastructure/dal/services/data_models_repository/req_sign_doc_data_repository.dart';
import '../../../../../infrastructure/navigation/app_routes/navigation.dart';
import '../../../../../infrastructure/navigation/app_routes/routes.dart';

part 'req_sign_selected_doc_event.dart';
part 'req_sign_selected_doc_state.dart';

class ReqSignSelectedDocBloc extends Bloc<ReqSignSelectedDocEvent, ReqSignSelectedDocState> {
  final ReqSignDocumentRepository dataRepository;

  ReqSignSelectedDocBloc(this.dataRepository) : super(const ReqSignSelectedDocInitial()) {
    on<InitialEvent>(_initializeFiles);
    on<AddNewFileEvent>(_addNewFiles);
    on<RemoveFileEvent>(_removeFile);

    /// go to next screen
    on<NextNavigateEvent>(_nextNavigation);
  }

  FutureOr<void> _initializeFiles(InitialEvent event, Emitter<ReqSignSelectedDocState> emit) async {
    emit(FileSelectedState(event.files));
  }

  FutureOr<void> _addNewFiles(AddNewFileEvent event, Emitter<ReqSignSelectedDocState> emit) async {
    List<SelectedFileModel> currentFiles = [];
    if (state is FileSelectedState) {
      currentFiles = List.from((state as FileSelectedState).selectedPdfFiles);
    }

    var pickedFiles = await FilePicker.pick();

    if (pickedFiles != null) {
      for (var file in pickedFiles) {
        final model = await FileToModel.convert(file);
        currentFiles.add(model);
      }
    }

    emit(FileSelectedState(currentFiles));
  }

  FutureOr<void> _removeFile(RemoveFileEvent event, Emitter<ReqSignSelectedDocState> emit) {
    if (state is FileSelectedState || state is ReqSignSelectedDocInitial) {
      final updatedFiles =
          List<SelectedFileModel>.from((state as FileSelectedState).selectedPdfFiles);
      if (event.index >= 0 && event.index < updatedFiles.length) {
        updatedFiles.removeAt(event.index);
      }

      emit(FileSelectedState(updatedFiles));
    }
  }

  FutureOr<void> _nextNavigation(NextNavigateEvent event, Emitter<ReqSignSelectedDocState> emit) {
    if (state is FileSelectedState || state is ReqSignSelectedDocInitial) {
      final updatedFiles = List<SelectedFileModel>.from(
        (state as FileSelectedState).selectedPdfFiles,
      );

      /// update dataRepository by add Selected Files in document model as string json json string form
      final modelString = SelectedFilesModelHelper.toJsonString(updatedFiles);

      dataRepository.updateFile(modelString.toString());

      Go.toNamed(Routes.REQ_SIGN_AGREEMENT_DETAIL);
    }
  }
}
