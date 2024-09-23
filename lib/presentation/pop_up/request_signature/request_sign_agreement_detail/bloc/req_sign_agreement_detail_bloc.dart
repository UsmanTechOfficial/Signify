import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'req_sign_agreement_detail_event.dart';
part 'req_sign_agreement_detail_state.dart';

class ReqSignAgreementDetailBloc extends Bloc<ReqSignAgreementDetailEvent, ReqSignAgreementDetailState> {
  ReqSignAgreementDetailBloc() : super(ReqSignAgreementDetailInitial()) {
    on<ReqSignAgreementDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
