import '../../../domain/consts/consts.dart';

class SigningProcessCubitContainer {
  static inject() async {
    getIt.registerFactory<SigningProcessCubitContainer>(
        () => SigningProcessCubitContainer());
  }
}
