import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_template_assign_fields_event.dart';
part 'add_template_assign_fields_state.dart';

class AddTemplateAssignFieldsBloc
    extends Bloc<AddTemplateAssignFieldsEvent, AddTemplateAssignFieldsState> {
  AddTemplateAssignFieldsBloc() : super(AddTemplateAssignFieldsInitial()) {
    on<AddTemplateAssignFieldsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
