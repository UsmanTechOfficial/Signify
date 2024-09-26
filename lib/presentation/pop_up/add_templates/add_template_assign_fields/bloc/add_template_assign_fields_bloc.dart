import 'dart:typed_data';

import 'package:dyno_sign/presentation/pop_up/add_templates/add_template_selected_doc/bloc/add_template_selected_doc_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_template_assign_fields_event.dart';
part 'add_template_assign_fields_state.dart';

class AddTemplateAssignFieldsBloc
    extends Bloc<AddTemplateAssignFieldsEvent, AddTemplateAssignFieldsState> {
  AddTemplateAssignFieldsBloc() : super(const AddTemplateAssignFieldsInitial()) {
    on<DocumentPreviewRequested>(_onDocumentPreviewRequested);
    on<DocumentSelected>(_onDocumentSelected);
  }

  Future<void> _onDocumentPreviewRequested(
      DocumentPreviewRequested event, Emitter<AddTemplateAssignFieldsState> emit) async {
    emit(DocumentPreviewLoading());
    try {
      for (var file in addTemplateSelectedPdfFileList) {
        // final firstPage = await PdfSinglePage.get(file.xFile!);
        // final imageBytes = firstPage?.bytes;
        //
        // if (imageBytes != null) {
        //   emit(DocumentPreviewLoaded(imageBytes));
        // }
      }
    } catch (e) {
      emit(DocumentPreviewError(e.toString()));
    }
  }

  void _onDocumentSelected(DocumentSelected event, Emitter<AddTemplateAssignFieldsState> emit) {
    emit(AssignFieldSelectedDoc(event.index));
  }
}
