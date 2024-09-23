import '../../../../../domain/consts/global_var.dart';
import '../../../../../domain/core/interfaces/bindings.dart';
import '../../../../../presentation/pop_up/sign_documents/send_by_others/by_other_agreement_detail/bloc/by_other_agreement_detail_bloc.dart';

class ByOtherAgreementDetailBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<ByOtherAgreementDetailBloc>(
        () => ByOtherAgreementDetailBloc());
  }
}
