import 'package:flutter_bloc/flutter_bloc.dart';
import 'agreements_event.dart';
import 'agreements_state.dart';

class AgreementsBloc extends Bloc<AgreementsEvent, AgreementsState> {
  AgreementsBloc() : super(AgreementsInitial()) {
    on<AgreementsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
