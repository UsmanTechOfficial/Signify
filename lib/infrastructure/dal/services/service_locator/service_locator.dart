import 'package:dyno_sign/domain/consts/global_var.dart';

import '../api_services/api_helper.dart';
import '../global_services/storage_service.dart';

class ServiceLocator {
  static Future<void> init() async {
    getIt.registerLazySingleton<StorageService>(() => StorageService());
    getIt.registerLazySingleton<ApiHelper>(() => ApiHelper());
  }
}
