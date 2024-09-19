import 'package:dyno_sign/domain/core/interfaces/bindings.dart';
import 'package:dyno_sign/presentation/auth/login/bloc/login_bloc.dart';

import '../../../../domain/consts/global_var.dart';

class LoginBlocBindings extends Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<LoginBloc>(() => LoginBloc());
  }
}
