import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'req_sign_assign_fields_event.dart';
part 'req_sign_assign_fields_state.dart';

class ReqSignAssignFieldsBloc extends Bloc<ReqSignAssignFieldsEvent, ReqSignAssignFieldsState> {
  ReqSignAssignFieldsBloc() : super(ReqSignAssignFieldsInitial()) {
    on<ReqSignAssignFieldsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
