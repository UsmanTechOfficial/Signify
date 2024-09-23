import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'req_sign_recipient_detail_event.dart';
part 'req_sign_recipient_detail_state.dart';

class ReqSignRecipientDetailBloc extends Bloc<ReqSignRecipientDetailEvent, ReqSignRecipientDetailState> {
  ReqSignRecipientDetailBloc() : super(ReqSignRecipientDetailInitial()) {
    on<ReqSignRecipientDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
