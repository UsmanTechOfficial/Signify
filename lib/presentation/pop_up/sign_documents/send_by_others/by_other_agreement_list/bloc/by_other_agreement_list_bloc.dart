import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'by_other_agreement_list_event.dart';
part 'by_other_agreement_list_state.dart';

class ByOtherAgreementListBloc
    extends Bloc<ByOtherAgreementListEvent, ByOtherAgreementListState> {
  ByOtherAgreementListBloc() : super(ByOtherAgreementListInitial()) {
    on<ByOtherAgreementListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
