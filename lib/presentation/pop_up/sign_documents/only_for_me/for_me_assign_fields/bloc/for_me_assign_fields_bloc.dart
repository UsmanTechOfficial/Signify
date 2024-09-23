import 'dart:typed_data';

import 'package:dyno_sign/presentation/pop_up/sign_documents/only_for_me/for_me_selected_document/bloc/for_me_selected_doc_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../domain/utils/utils.dart';

part 'for_me_assign_fields_event.dart';
part 'for_me_assign_fields_state.dart';

class ForMeAssignFieldsBloc
    extends Bloc<ForMeAssignFieldsEvent, ForMeAssignFieldsState> {
  ForMeAssignFieldsBloc() : super(const ForMeAssignFieldsInitial()) {
    on<DocumentPreviewRequested>(_onDocumentPreviewRequested);
    on<DocumentSelected>(_onDocumentSelected);
  }

  Future<void> _onDocumentPreviewRequested(DocumentPreviewRequested event,
      Emitter<ForMeAssignFieldsState> emit) async {
    emit(const DocumentPreviewLoading());
    try {
      for (var file in forMeSelectedPdfFileList) {
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

  void _onDocumentSelected(
      DocumentSelected event, Emitter<ForMeAssignFieldsState> emit) {
    emit(AssignFieldSelectedDoc(event.index));
  }
}
