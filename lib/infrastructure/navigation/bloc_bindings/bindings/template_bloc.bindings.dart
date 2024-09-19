import 'package:dyno_sign/domain/core/interfaces/bindings.dart';

import '../../../../domain/consts/consts.dart';
import '../../../../presentation/dashboard/views/templates/bloc/templates_bloc.dart';

class TemplatesBlocBindings implements Bindings {
  @override
  void dependencies() async {
    getIt.registerFactory<TemplatesBloc>(() => TemplatesBloc());
  }
}
