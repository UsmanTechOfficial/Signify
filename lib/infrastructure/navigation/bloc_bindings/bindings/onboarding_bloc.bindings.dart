import 'package:dyno_sign/domain/core/interfaces/bindings.dart';
import 'package:dyno_sign/presentation/blocs.dart';

import '../../../../domain/consts/global_var.dart';

class OnboardingBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerFactory<OnboardingBloc>(() => OnboardingBloc());
  }
}
