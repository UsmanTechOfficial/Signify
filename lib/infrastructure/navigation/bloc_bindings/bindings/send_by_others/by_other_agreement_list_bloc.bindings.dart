import '../../../../../domain/consts/global_var.dart';
import '../../../../../domain/core/interfaces/bindings.dart';
import '../../../../../presentation/pop_up/sign_documents/send_by_others/by_other_agreement_list/bloc/by_other_agreement_list_bloc.dart';

class ByOtherAgreementListBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<ByOtherAgreementListBloc>(() => ByOtherAgreementListBloc());
  }
}
