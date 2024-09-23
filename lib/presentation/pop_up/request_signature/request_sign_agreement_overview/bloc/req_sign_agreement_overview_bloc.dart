import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'req_sign_agreement_overview_event.dart';
part 'req_sign_agreement_overview_state.dart';

class ReqSignAgreementOverviewBloc extends Bloc<ReqSignAgreementOverviewEvent, ReqSignAgreementOverviewState> {
  ReqSignAgreementOverviewBloc() : super(ReqSignAgreementOverviewInitial()) {
    on<ReqSignAgreementOverviewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
