import '../../../domain/consts/consts.dart';
import '../../../presentation/dashboard/views/templates/bloc/templates_bloc.dart';

class TemplatesBlocContainer {
  static inject() async {
    getIt.registerFactory<TemplatesBloc>(() => TemplatesBloc());
  }
}
