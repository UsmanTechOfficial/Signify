import 'package:flutter_bloc/flutter_bloc.dart';
import 'email_detail_event.dart';
import 'email_detail_state.dart';

class EmailDetailViewBloc
    extends Bloc<EmailDetailViewEvent, EmailDetailViewState> {
  EmailDetailViewBloc() : super(EmailDetailViewInitial()) {
    on<EmailDetailViewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
