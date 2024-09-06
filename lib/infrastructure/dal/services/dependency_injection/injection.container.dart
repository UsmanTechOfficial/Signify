import 'package:dyno_sign/infrastructure/dal/services/dependency_injection/agreements.bloc.container.dart';

class InjectionContainer {
  static Future<void> init() async {
    AgreementsBlocContainer.inject();
  }
}
