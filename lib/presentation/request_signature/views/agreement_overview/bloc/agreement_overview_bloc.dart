import 'package:flutter_bloc/flutter_bloc.dart';

import 'agreement_overview_event.dart';
import 'agreement_overview_state.dart';

class AgreementOverviewBloc extends Bloc<AgreementOverviewEvent, AgreementOverviewState> {
  AgreementOverviewBloc() : super(AgreementOverviewInitial()) {
    on<AgreementOverviewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
