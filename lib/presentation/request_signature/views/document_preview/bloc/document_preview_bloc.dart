import 'package:flutter_bloc/flutter_bloc.dart';

import 'document_preview_event.dart';
import 'document_preview_state.dart';

class DocumentPreviewBloc extends Bloc<DocumentPreviewEvent, DocumentPreviewState> {
  DocumentPreviewBloc() : super(DocumentPreviewInitial()) {
    on<DocumentPreviewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
