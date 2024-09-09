import 'package:dyno_sign/presentation/signing_process/bloc/signing_process_cubit.dart';

import '../../../domain/consts/consts.dart';

class SigningProcessCubitContainer {
  static inject() async {
    getIt.registerFactory<SigningProcessCubit>(() => SigningProcessCubit());
  }
}
