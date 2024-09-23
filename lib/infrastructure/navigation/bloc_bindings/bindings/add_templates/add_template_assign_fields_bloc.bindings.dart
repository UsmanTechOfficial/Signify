import '../../../../../domain/consts/global_var.dart';
import '../../../../../domain/core/interfaces/bindings.dart';
import '../../../../../presentation/pop_up/add_templates/add_template_assign_fields/bloc/add_template_assign_fields_bloc.dart';

class AddTemplateAssignFieldsBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<AddTemplateAssignFieldsBloc>(
        () => AddTemplateAssignFieldsBloc());
  }
}
