import 'package:dyno_sign/presentation/pop_up/add_templates/add_template_detail_added/bloc/add_template_detail_added_bloc.dart';

import '../../../../../domain/consts/global_var.dart';
import '../../../../../domain/core/interfaces/bindings.dart';

class AddTemplateDetailBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<AddTemplateDetailAddedBloc>(
        () => AddTemplateDetailAddedBloc());
  }
}
