import 'package:dyno_sign/domain/core/interfaces/bindings.dart';

import '../../../../domain/consts/consts.dart';
import '../../../../presentation/blocs.dart';

class DashboardBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<DashboardBloc>(() => DashboardBloc());
  }
}
