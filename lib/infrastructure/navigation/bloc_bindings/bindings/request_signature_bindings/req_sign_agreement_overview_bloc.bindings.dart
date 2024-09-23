import '../../../../../domain/consts/global_var.dart';
import '../../../../../domain/core/interfaces/bindings.dart';
import '../../../../../presentation/pop_up/request_signature/request_sign_agreement_overview/bloc/req_sign_agreement_overview_bloc.dart';

class ReqSignAgreementOverviewBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<ReqSignAgreementOverviewBloc>(() => ReqSignAgreementOverviewBloc());
  }
}
