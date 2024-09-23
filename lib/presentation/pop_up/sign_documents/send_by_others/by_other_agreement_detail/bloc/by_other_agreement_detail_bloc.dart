import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'by_other_agreement_detail_event.dart';
part 'by_other_agreement_detail_state.dart';

class ByOtherAgreementDetailBloc
    extends Bloc<ByOtherAgreementDetailEvent, ByOtherAgreementDetailState> {
  ByOtherAgreementDetailBloc() : super(ByOtherAgreementDetailInitial()) {
    on<ByOtherAgreementDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
