import 'package:dyno_sign/infrastructure/navigation/injection_container/dashboard_bloc.container.dart';
import 'package:dyno_sign/infrastructure/navigation/injection_container/signing_process_cubit.container.dart';

import 'agreements_bloc.container.dart';
import 'home_bloc.container.dart';
import 'profile_bloc.container.dart';
import 'template_bloc.container.dart';

class InjectionContainer {
  static Future<void> init() async {
    DashboardBlocContainer.inject();

    HomeBlocContainer.inject();

    AgreementsBlocContainer.inject();

    TemplatesBlocContainer.inject();

    ProfileBlocContainer.inject();

    SigningProcessCubitContainer.inject();
  }
}
