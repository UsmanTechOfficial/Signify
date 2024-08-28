import 'package:flutter_bloc/flutter_bloc.dart';
import 'request_signature_event.dart';
import 'request_signature_state.dart';

class RequestSignaturesBloc extends Bloc<RequestSignaturesEvent, RequestSignaturesState> {
  RequestSignaturesBloc() : super(RequestSignaturesState());
}
