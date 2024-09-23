import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'by_other_assigned_fields_event.dart';
part 'by_other_assigned_fields_state.dart';

class ByOtherAssignedFieldsBloc
    extends Bloc<ByOtherAssignedFieldsEvent, ByOtherAssignedFieldsState> {
  ByOtherAssignedFieldsBloc() : super(ByOtherAssignedFieldsInitial()) {
    on<ByOtherAssignedFieldsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
