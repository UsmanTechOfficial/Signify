import 'package:dyno_sign/domain/consts/global_var.dart';

class FirstTimeService {
  static bool isFirstTime() {
    return getStorage.read('isFirstTime') ?? true;
  }

  static markAsOpened() {
    getStorage.write('isFirstTime', false);
  }

  static markASClosed() {
    getStorage.remove("isFirstTime");
  }
}
