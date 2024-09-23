import '../../../../../domain/consts/global_var.dart';
import '../../../../../domain/core/interfaces/bindings.dart';
import '../../../../../presentation/pop_up/sign_documents/only_for_me/for_me_assign_fields/bloc/for_me_assign_fields_bloc.dart';

class ForMeAssignFieldBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<ForMeAssignFieldsBloc>(() => ForMeAssignFieldsBloc());
  }
}
