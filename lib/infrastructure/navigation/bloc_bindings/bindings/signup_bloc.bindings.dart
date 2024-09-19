import 'package:dyno_sign/domain/core/interfaces/bindings.dart';
import 'package:dyno_sign/presentation/auth/signup/bloc/signup_bloc.dart';

import '../../../../domain/consts/global_var.dart';

class SignupBlocBindings extends Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<SignupBloc>(() => SignupBloc());
  }
}
