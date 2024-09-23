import '../../../../../domain/consts/global_var.dart';
import '../../../../../domain/core/interfaces/bindings.dart';
import '../../../../../presentation/pop_up/add_templates/add_templates_overview/bloc/add_templates_overview_bloc.dart';

class AddTemplatesOverviewBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<AddTemplatesOverviewBloc>(() => AddTemplatesOverviewBloc());
  }
}
