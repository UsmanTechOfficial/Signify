import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
