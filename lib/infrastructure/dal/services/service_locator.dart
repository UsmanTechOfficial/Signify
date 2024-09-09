import 'package:dyno_sign/domain/consts/global_var.dart';
import 'package:dyno_sign/infrastructure/dal/services/api_services/api_helper.dart';

class ServiceLocator {
  static Future<void> init() async {
    getIt.registerSingleton<ApiHelper>(ApiHelper());
  }
}
