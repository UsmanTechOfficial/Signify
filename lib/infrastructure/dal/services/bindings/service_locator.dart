import 'package:get_it/get_it.dart';

import '../api_services/api_helper.dart';
import '../global_services/storage_service.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static final ServiceLocator _internal = ServiceLocator._();

  // Private constructor
  ServiceLocator._() {
    _setupServiceLocator();
  }

  factory ServiceLocator() {
    return _internal;
  }

  void _setupServiceLocator() {
    getIt.registerLazySingleton<StorageService>(() => StorageService());
    getIt.registerLazySingleton<ApiHelper>(() => ApiHelper());
  }
}
