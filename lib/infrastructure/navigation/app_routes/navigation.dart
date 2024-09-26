import 'package:dyno_sign/infrastructure/dal/models/selected_file.model.dart';
import 'package:dyno_sign/presentation/Initials_manager/bloc/initials_manager_bloc.dart';
import 'package:dyno_sign/presentation/Initials_manager/initials_manager_view.dart';
import 'package:dyno_sign/presentation/pop_up/request_signature/request_sign_agreement_detail/bloc/req_sign_agreement_detail_bloc.dart';
import 'package:dyno_sign/presentation/pop_up/request_signature/request_sign_agreement_detail/req_sign_agreement_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/consts/consts.dart';
import '../../../presentation/blocs.dart';
import '../../../presentation/pop_up/request_signature/request_sign_selected_document/bloc/req_sign_selected_doc_bloc.dart';
import '../../../presentation/pop_up/request_signature/request_sign_selected_document/req_sign_selected_doc_view.dart';
import '../../../presentation/screens.dart';
import 'routes.dart';

class Go {
  static Future<void> toNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamed(
          routeName,
          arguments: arguments,
        ) ??
        Future.value();
  }

  static Future<void> to(Widget page, {BuildContext? context}) {
    if (context != null) {
      return Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => page),
      );
    }
    return navigatorKey.currentState?.push(
          MaterialPageRoute(builder: (_) => page),
        ) ??
        Future.value();
  }

  static Future<void> offAndToNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushReplacementNamed(
          routeName,
          arguments: arguments,
        ) ??
        Future.value();
  }

  static Future<void> offAndTo(Widget page, {BuildContext? context}) {
    if (context != null) {
      return Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => page),
      );
    }
    return navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(builder: (_) => page),
        ) ??
        Future.value();
  }

  static Future<void> offAllAndToNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
          routeName,
          (Route<dynamic> route) => false,
          arguments: arguments,
        ) ??
        Future.value();
  }

  static Future<void> offAllAndTo(Widget page, {BuildContext? context}) {
    if (context != null) {
      return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => page),
        (Route<dynamic> route) => false,
      );
    }
    return navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => page),
          (Route<dynamic> route) => false,
        ) ??
        Future.value();
  }

  static back() {
    navigatorKey.currentState?.pop();
  }
}

class AppPages {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // DashboardView
      case Routes.DASHBOARD:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<DashboardBloc>(),
            child: const DashboardView(),
          ),
          settings: settings,
        );

      // GetStartedView
      case Routes.ONBOARDING:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<OnboardingBloc>(),
            child: const GetStartedView(),
          ),
          settings: settings,
        );

      // SplashView
      case Routes.SPLASH:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SplashBloc>(),
            child: const SplashView(),
          ),
          settings: settings,
        );

      // LoginView
      case Routes.LOGIN:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginBloc>(),
            child: const LoginView(),
          ),
          settings: settings,
        );

      // SignupView
      case Routes.SIGNUP:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SignupBloc>(),
            child: const SignupView(),
          ),
          settings: settings,
        );

      // ForgetPasswordView
      case Routes.FORGET_PASSWORD:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ForgetPasswordBloc>(),
            child: const ForgetPasswordView(),
          ),
          settings: settings,
        );

      // SignatureManagerView
      case Routes.SIGNATURE_MANAGER:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignatureManagerBloc(),
            child: const SignatureManagerView(),
          ),
          settings: settings,
        );

      // InitialsManagerView
      case Routes.INITIALS_MANAGER:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => InitialsManagerBloc(),
            child: const InitialsManagerView(),
          ),
          settings: settings,
        );

      // SettingsView
      case Routes.SETTINGS:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SettingsBloc(),
            child: const SettingsView(),
          ),
          settings: settings,
        );

      // FoldersView
      case Routes.FOLDERS:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<FoldersBloc>(),
            child: const FoldersView(),
          ),
          settings: settings,
        );

      /// request signature navigation

      // ReqSignSelectedDocView
      case Routes.REQ_SIGN_SELECTED_DOC:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ReqSignSelectedDocBloc>(),
            child: ReqSignSelectedDocView(file: settings.arguments as SelectedFileModel),
          ),
          settings: settings,
        );

      // ReqSignAgreementDetailView
      case Routes.REQ_SIGN_AGREEMENT_DETAIL:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ReqSignAgreementDetailBloc>(),
            child: const ReqSignAgreementDetailView(),
          ),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
