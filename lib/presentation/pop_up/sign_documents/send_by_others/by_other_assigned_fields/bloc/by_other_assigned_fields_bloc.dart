import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
