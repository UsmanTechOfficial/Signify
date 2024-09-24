import '../../../../../domain/consts/global_var.dart';
import '../../../../../domain/core/interfaces/bindings.dart';
import '../../../../../presentation/pop_up/request_signature/request_sign_assign_fields/bloc/req_sign_assign_fields_bloc.dart';

class ReqSignAssignFieldsBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<ReqSignAssignFieldsBloc>(() => ReqSignAssignFieldsBloc());
  }
}
