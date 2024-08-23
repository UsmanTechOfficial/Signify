import 'package:get_it/get_it.dart';

import '../../../infrastructure/dal/services/global_services/storage_service.dart';

class FirstTimeService {
  static final StorageService _storageService =
      GetIt.instance<StorageService>();

  static bool isFirstTime() {
    return _storageService.getStorage.read('isFirstTime') ?? true;
  }

  static markAsOpened() {
    _storageService.getStorage.write('isFirstTime', false);
  }

  static markASClosed() {
    _storageService.getStorage.remove("isFirstTime");
  }
}
