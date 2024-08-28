import 'package:flutter_bloc/flutter_bloc.dart';
import 'agreement_detail_added_event.dart';
import 'agreement_detail_added_state.dart';

class AgreementDetailAddedBloc
    extends Bloc<AgreementDetailAddedEvent, AgreementDetailAddedState> {
  AgreementDetailAddedBloc() : super(const AgreementDetailAddedState()) {
    on<UpdateAgreementName>((event, emit) {
      emit(state.copyWith(agreementName: event.agreementName));
    });

    on<UpdateDescription>((event, emit) {
      emit(state.copyWith(description: event.description));
    });

    on<SelectRole>((event, emit) {
      emit(state.copyWith(selectedRoleIndex: event.selectedRoleIndex));
    });

    on<UpdateRecipientName>((event, emit) {
      emit(state.copyWith(recipientName: event.recipientName));
    });

    on<UpdateRecipientEmail>((event, emit) {
      emit(state.copyWith(recipientEmail: event.recipientEmail));
    });

    on<SubmitAgreement>((event, emit) {
      // Perform any submission logic here
      emit(state.copyWith(isSubmitted: true));
    });
  }
}
