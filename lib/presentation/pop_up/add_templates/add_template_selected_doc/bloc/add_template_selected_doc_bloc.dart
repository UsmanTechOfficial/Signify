import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_template_selected_doc_event.dart';
part 'add_template_selected_doc_state.dart';

class AddTemplateSelectedDocBloc
    extends Bloc<AddTemplateSelectedDocEvent, AddTemplateSelectedDocState> {
  AddTemplateSelectedDocBloc() : super(AddTemplateSelectedDocInitial()) {
    on<AddTemplateSelectedDocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
