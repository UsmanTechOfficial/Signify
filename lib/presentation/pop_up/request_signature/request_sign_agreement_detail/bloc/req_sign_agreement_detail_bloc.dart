import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/dal/services/data_models_repository/req_sign_doc_data_repository.dart';

part 'req_sign_agreement_detail_event.dart';
part 'req_sign_agreement_detail_state.dart';

class ReqSignAgreementDetailBloc
    extends Bloc<ReqSignAgreementDetailEvent, ReqSignAgreementDetailState> {
  final ReqSignDocDataRepository dataRepository;

  ReqSignAgreementDetailBloc(this.dataRepository) : super(ReqSignAgreementDetailInitial()) {
    on<ReqSignAgreementDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
