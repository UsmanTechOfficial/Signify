import '../../../../../domain/consts/global_var.dart';
import '../../../../../domain/core/interfaces/bindings.dart';
import '../../../../../presentation/pop_up/add_templates/add_template_selected_doc/bloc/add_template_selected_doc_bloc.dart';

class AddTemplateSelectedDocBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<AddTemplateSelectedDocBloc>(() => AddTemplateSelectedDocBloc());
  }
}
