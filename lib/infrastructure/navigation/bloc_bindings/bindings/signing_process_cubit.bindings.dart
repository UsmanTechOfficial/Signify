import 'package:dyno_sign/domain/core/interfaces/bindings.dart';
import 'package:dyno_sign/presentation/signing_process/bloc/signing_process_cubit.dart';

import '../../../../domain/consts/consts.dart';

class SigningProcessCubitBindings implements Bindings {
  @override
  void dependencies() async {
    getIt.registerSingleton<SigningProcessCubit>(SigningProcessCubit());
  }
}
