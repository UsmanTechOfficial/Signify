import 'package:dyno_sign/domain/core/interfaces/bindings.dart';
import 'package:dyno_sign/presentation/auth/forget_password/bloc/forget_password_bloc.dart';

import '../../../../domain/consts/global_var.dart';

class ForgetPasswordBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<ForgetPasswordBloc>(() => ForgetPasswordBloc());
  }
}
