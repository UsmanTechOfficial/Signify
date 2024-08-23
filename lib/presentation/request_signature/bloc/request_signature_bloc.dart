import 'package:flutter_bloc/flutter_bloc.dart';
import 'request_signature_event.dart';
import 'request_signature_state.dart';

class RequestSignatureBloc extends Bloc<RequestSignatureEvent, RequestSignatureState> {
  RequestSignatureBloc() : super(RequestSignatureInitial()) {
    on<RequestSignatureEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
