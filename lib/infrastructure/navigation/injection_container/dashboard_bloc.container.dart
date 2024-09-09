import '../../../domain/consts/consts.dart';
import '../../../presentation/blocs.dart';

class DashboardBlocContainer {
  static inject() async {
    getIt.registerFactory<DashboardBloc>(() => DashboardBloc());
  }
}
