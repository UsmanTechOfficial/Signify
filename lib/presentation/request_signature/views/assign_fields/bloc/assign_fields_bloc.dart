import 'package:flutter_bloc/flutter_bloc.dart';

import 'assign_fields_event.dart';
import 'assign_fields_state.dart';

class AssignFieldsBloc extends Bloc<AssignFieldsEvent, AssignFieldsState> {
  AssignFieldsBloc() : super(AssignFieldsInitial()) {
    on<AssignFieldsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
