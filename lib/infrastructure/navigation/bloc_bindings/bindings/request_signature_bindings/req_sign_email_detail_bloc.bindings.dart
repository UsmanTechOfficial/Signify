import 'package:dyno_sign/presentation/pop_up/request_signature/request_sign_email_detail/bloc/req_sign_email_detail_bloc.dart';

import '../../../../../domain/consts/global_var.dart';
import '../../../../../domain/core/interfaces/bindings.dart';

class ReqSignEmailDetailBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<ReqSignEmailDetailBloc>(
        () => ReqSignEmailDetailBloc());
  }
}
