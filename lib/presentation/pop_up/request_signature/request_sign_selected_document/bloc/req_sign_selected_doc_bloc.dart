import 'dart:developer';

import 'package:dyno_sign/infrastructure/dal/models/request_signature_models/req_sign_doc_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/utils/utils.dart';
import '../../../../../infrastructure/dal/models/selected_file.model.dart';
import '../../../../../infrastructure/dal/services/data_models_repository/req_sign_doc_data_repository.dart';

part 'req_sign_selected_doc_event.dart';
part 'req_sign_selected_doc_state.dart';

List<SelectedFileModel> selectedPdfFileList = [];

SelectedFileModel selectedFileModel = SelectedFileModel.empty();
AgreementDetailModel agreementDetailModel = AgreementDetailModel.empty();
EmailDetailModel emailDetailModel = EmailDetailModel.empty();
RecipientDetailModel recipientDetailModel = RecipientDetailModel.empty();
UserModel userModel = UserModel.empty();

ReqSignDocModel reqSignDocModel = ReqSignDocModel.empty();

class ReqSignSelectedDocBloc extends Bloc<ReqSignSelectedDocEvent, ReqSignSelectedDocState> {
  final ReqSignDocDataRepository dataRepository;

  ReqSignSelectedDocBloc(this.dataRepository) : super(const ReqSignSelectedDocInitial()) {
    on<AddNewFileEvent>(
      (event, emit) => _addNewFile(emit, state),
    );
    on<RemoveFileEvent>(
      (event, emit) => _removeFile(event.index, emit, state),
    );
  }

  void _addNewFile(
      Emitter<ReqSignSelectedDocState> emit, ReqSignSelectedDocState currentState) async {
    final selectedFile = await FilePicker.pick();

    if (selectedFile.isNotEmpty) {
      try {
        final List<SelectedFileModel> updatedList = List.from(
          (currentState is FileSelectedState) ? currentState.selectedPdfFileList : [],
        );

        for (var file in selectedFile) {
          final model = await FileToModel.convert(file);
          updatedList.add(model);
          selectedPdfFileList.add(model);

          reqSignDocModel.copyWith(selectedFile: List.from(updatedList));

          log('File added: ${model.name}');
        }

        emit(FileSelectedState(updatedList));
      } catch (e) {
        log(e.toString());
      }
    }
  }

  void _removeFile(
      int index, Emitter<ReqSignSelectedDocState> emit, ReqSignSelectedDocState currentState) {
    if (currentState is FileSelectedState) {
      final updatedList = List<SelectedFileModel>.from(currentState.selectedPdfFileList);
      updatedList.removeAt(index);
      selectedPdfFileList.removeAt(index);
      reqSignDocModel.selectedFile.removeAt(index);

      emit(FileSelectedState(updatedList));
    }
  }

  @override
  Future<void> close() {
    selectedPdfFileList.clear();
    return super.close();
  }
}
