import '../../../../../domain/consts/global_var.dart';
import '../../../../../domain/core/interfaces/bindings.dart';
import '../../../../../presentation/pop_up/add_templates/add_template_detail/bloc/add_template_detail_bloc.dart';

class AddTemplateDetailBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<AddTemplateDetailBloc>(() => AddTemplateDetailBloc());
  }
}
