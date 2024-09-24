import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'req_sign_email_detail_event.dart';
part 'req_sign_email_detail_state.dart';

class ReqSignEmailDetailBloc extends Bloc<ReqSignEmailDetailEvent, ReqSignEmailDetailState> {
  ReqSignEmailDetailBloc() : super(ReqSignEmailDetailInitial()) {
    on<ReqSignEmailDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
