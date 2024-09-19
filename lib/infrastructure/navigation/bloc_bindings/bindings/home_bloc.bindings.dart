import 'package:dyno_sign/domain/core/interfaces/bindings.dart';

import '../../../../domain/consts/consts.dart';
import '../../../../presentation/dashboard/views/home/bloc/home_bloc.dart';

class HomeBlocBindings implements Bindings {
  @override
  void dependencies() async {
    getIt.registerFactory<HomeBloc>(() => HomeBloc());
  }
}
