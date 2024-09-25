import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/dal/services/data_models_repository/req_sign_doc_data_repository.dart';

part 'req_sign_recipient_detail_event.dart';
part 'req_sign_recipient_detail_state.dart';

class ReqSignRecipientDetailBloc
    extends Bloc<ReqSignRecipientDetailEvent, ReqSignRecipientDetailState> {
  final ReqSignDocDataRepository dataRepository;

  ReqSignRecipientDetailBloc(this.dataRepository) : super(ReqSignRecipientDetailInitial()) {
    on<ReqSignRecipientDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
