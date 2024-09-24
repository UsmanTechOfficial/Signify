import '../../../../../domain/consts/global_var.dart';
import '../../../../../domain/core/interfaces/bindings.dart';
import '../../../../../presentation/pop_up/add_templates/add_template_recipient_detail/bloc/add_template_recipient_detail_bloc.dart';

class AddTemplateRecipientDetailBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<AddTemplateRecipientDetailBloc>(() => AddTemplateRecipientDetailBloc());
  }
}
