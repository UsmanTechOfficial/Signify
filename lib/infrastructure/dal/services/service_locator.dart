import 'package:dyno_sign/domain/consts/global_var.dart';
import 'package:dyno_sign/domain/core/interfaces/bindings.dart';
import 'package:dyno_sign/infrastructure/dal/services/api_services/api_helper.dart';

class ServiceLocator extends Bindings {
  @override
  void dependencies() {
    getIt.registerFactory(() => ApiHelper());
  }
}
