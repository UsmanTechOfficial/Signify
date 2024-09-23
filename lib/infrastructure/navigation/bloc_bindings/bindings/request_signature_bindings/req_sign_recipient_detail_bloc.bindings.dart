import '../../../../../domain/consts/global_var.dart';
import '../../../../../domain/core/interfaces/bindings.dart';
import '../../../../../presentation/pop_up/request_signature/request_sign_recipient_detail/bloc/req_sign_recipient_detail_bloc.dart';

class ReqSignRecipientDetailBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<ReqSignRecipientDetailBloc>(() => ReqSignRecipientDetailBloc());
  }
}
