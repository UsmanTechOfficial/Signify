import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/forget_password_bloc.bindings.dart';
import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/login_bloc.bindings.dart';
import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/onboarding_bloc.bindings.dart';
import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/signup_bloc.bindings.dart';
import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/splash_bloc.bindings.dart';

import '../../../domain/core/interfaces/bindings.dart';
import 'bindings/agreements_bloc.bindings.dart';
import 'bindings/dashboard_bloc.bindings.dart';
import 'bindings/folder_bloc.bindings.dart';
import 'bindings/home_bloc.bindings.dart';
import 'bindings/profile_bloc.bindings.dart';
import 'bindings/signing_process_cubit.bindings.dart';
import 'bindings/template_bloc.bindings.dart';

class BlocBindings implements Bindings {
  final List<Bindings> _blocBindings = [
    SplashBlocBindings(),
    OnboardingBlocBindings(),
    LoginBlocBindings(),
    SignupBlocBindings(),
    ForgetPasswordBlocBindings(),
    DashboardBlocBindings(),
    HomeBlocBindings(),
    AgreementsBlocBindings(),
    TemplatesBlocBindings(),
    ProfileBlocBindings(),
    SigningProcessCubitBindings(),
    FoldersBlocBindings(),
  ];

  @override
  void dependencies() {
    for (var binding in _blocBindings) {
      binding.dependencies();
    }
  }
}
