import 'package:file_selector/file_selector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'selected_document_event.dart';
import 'selected_document_state.dart';

class SelectedDocumentBloc
    extends Bloc<SelectedDocumentEvent, SelectedDocumentState> {
  SelectedDocumentBloc() : super(const SelectedDocumentState()) {
    on<SelectValueChanged>((event, emit) {
      emit(state.copyWith(selectedValue: event.value));

      on<SignSelected>((event, emit) {
        emit(state.copyWith(selectedSign: event.value));
      });

      on<FileSelected>((event, emit) {
        final updatedFiles = List<XFile>.from(state.loadedFiles)
          ..add(event.file);
        final updatedDates = List<DateTime>.from(state.filesDate)
          ..add(event.fileDate);
        emit(
            state.copyWith(loadedFiles: updatedFiles, filesDate: updatedDates));
      });

      on<RemoveFile>((event, emit) {
        final updatedFiles = List<XFile>.from(state.loadedFiles)
          ..removeAt(event.index);
        final updatedDates = List<DateTime>.from(state.filesDate)
          ..removeAt(event.index);
        emit(
            state.copyWith(loadedFiles: updatedFiles, filesDate: updatedDates));
      });
    });
  }

  Future<void> selectFile() async {
    final XFile? file = await openFile(
      acceptedTypeGroups: [
        const XTypeGroup(
          label: 'files',
          extensions: ['pdf', 'doc', 'jpg'],
        )
      ],
    );

    if (file != null) {
      add(FileSelected(file, await file.lastModified()));
    }
  }
}
