import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/dal/services/data_models_repository/req_sign_doc_data_repository.dart';

part 'req_sign_agreement_overview_event.dart';
part 'req_sign_agreement_overview_state.dart';

class ReqSignAgreementOverviewBloc
    extends Bloc<ReqSignAgreementOverviewEvent, ReqSignAgreementOverviewState> {
  final ReqSignDocumentRepository dataRepository;

  ReqSignAgreementOverviewBloc(this.dataRepository) : super(ReqSignAgreementOverviewInitial()) {
    on<ReqSignAgreementOverviewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
