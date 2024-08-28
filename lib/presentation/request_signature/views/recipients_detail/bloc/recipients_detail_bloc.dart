import 'package:flutter_bloc/flutter_bloc.dart';
import 'recipients_detail_event.dart';
import 'recipients_detail_state.dart';

class RecipientsDetailBloc extends Bloc<RecipientsDetailEvent, RecipientsDetailState> {
  RecipientsDetailBloc() : super(RecipientsDetailInitial()) {
    on<RecipientsDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
