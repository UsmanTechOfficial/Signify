import 'package:dyno_sign/infrastructure/navigation/app_routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages_import.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class Go {
  static Future<void> toNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState
            ?.pushNamed(routeName, arguments: arguments) ??
        Future.value();
  }

  static back() {
    navigatorKey.currentState?.pop();
  }

  static Future<void> offAndToNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState
            ?.pushReplacementNamed(routeName, arguments: arguments) ??
        Future.value();
  }

  static Future<void> offAllToNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
          routeName,
          (Route<dynamic> route) => false,
          arguments: arguments,
        ) ??
        Future.value();
  }
}

class AppPages {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.DASHBOARD:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => DashboardBloc(),
            child: const DashboardView(),
          ),
        );
      case Routes.ONBOARDING:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => OnboardingBloc(),
            child: const OnboardingView(),
          ),
        );
      case Routes.REQUESTSIGNATURE:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RequestSignatureBloc(),
            child: const RequestSignatureView(),
          ),
        );
      case Routes.SPLASH:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SplashBloc(),
            child: const SplashView(),
          ),
        );
      case Routes.LOGIN:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginBloc(),
            child: const LoginView(),
          ),
        );
      case Routes.SIGNUP:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignupBloc(),
            child: const SignupView(),
          ),
        );
      case Routes.FORGETPASSWORD:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ForgetPasswordBloc(),
            child: const ForgetPasswordView(),
          ),
        );
      default:
        return null;
    }
  }
}
