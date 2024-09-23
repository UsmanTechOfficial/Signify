import 'package:dyno_sign/presentation/Initials_manager/bloc/initials_manager_bloc.dart';
import 'package:dyno_sign/presentation/Initials_manager/initials_manager_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/consts/consts.dart';
import '../../../presentation/blocs.dart';
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
      /// DashboardView
      case Routes.DASHBOARD:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<DashboardBloc>(),
            child: const DashboardView(),
          ),
          settings: settings,
        );

      /// GetStartedView
      case Routes.ONBOARDING:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<OnboardingBloc>(),
            child: const GetStartedView(),
          ),
          settings: settings,
        );

      /// SplashView
      case Routes.SPLASH:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SplashBloc>(),
            child: const SplashView(),
          ),
          settings: settings,
        );

      /// LoginView
      case Routes.LOGIN:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginBloc>(),
            child: const LoginView(),
          ),
          settings: settings,
        );

      /// SignupView
      case Routes.SIGNUP:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SignupBloc>(),
            child: const SignupView(),
          ),
          settings: settings,
        );

      /// ForgetPasswordView
      case Routes.FORGET_PASSWORD:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ForgetPasswordBloc>(),
            child: const ForgetPasswordView(),
          ),
          settings: settings,
        );

      // /// DocumentSelectedView
      // case Routes.SELECTED_DOCUMENT:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final signingCubit = args['signingCubit'] as SigningProcessCubit;
      //   final signProcessTypes = args['signProcessTypes'] as SignProcessTypes;
      //
      //   return MaterialPageRoute(
      //     builder: (context) => DocumentSelectedView(
      //       signProcessTypes: signProcessTypes,
      //       signingCubit: signingCubit,
      //     ),
      //     settings: settings,
      //   );
      //
      // /// EmailDetailView
      // case Routes.EMAIL_DETAIL_VIEW:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final signProcessTypes = args['signProcessTypes'] as SignProcessTypes;
      //
      //   return MaterialPageRoute(
      //     builder: (context) => EmailDetailView(
      //       signProcessTypes: signProcessTypes,
      //     ),
      //     settings: settings,
      //   );
      //
      // /// RecipientsDetailView
      // case Routes.RECIPIENTS_DETAIL:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final signProcessTypes = args['signProcessTypes'] as SignProcessTypes;
      //
      //   return MaterialPageRoute(
      //     builder: (context) => RecipientsDetailView(
      //       signProcessTypes: signProcessTypes,
      //     ),
      //     settings: settings,
      //   );
      //
      // /// AssignFieldsView
      // case Routes.ASSIGN_FIELDS:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final signProcessTypes = args['signProcessTypes'] as SignProcessTypes;
      //
      //   return MaterialPageRoute(
      //     builder: (context) => AssignFieldsView(
      //       signProcessTypes: signProcessTypes,
      //     ),
      //     settings: settings,
      //   );
      //
      // /// AgreementsFromOthers
      // case Routes.AGREEMENTS_FROM_OTHER:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final signProcessTypes = args['signProcessTypes'] as SignProcessTypes;
      //
      //   return MaterialPageRoute(
      //     builder: (context) => AgreementsFromOthers(
      //       signProcessTypes: signProcessTypes,
      //     ),
      //     settings: settings,
      //   );
      //
      // /// AgreementOverviewView
      // case Routes.AGREEMENT_OVERVIEW:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final signProcessTypes = args['signProcessTypes'] as SignProcessTypes;
      //
      //   return MaterialPageRoute(
      //     builder: (context) => AgreementOverviewView(
      //       signProcessTypes: signProcessTypes,
      //     ),
      //     settings: settings,
      //   );
      //
      // /// AgreementDetailAddedView
      // case Routes.AGREEMENT_DETAIL_ADDED:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final signProcessTypes = args['signProcessTypes'] as SignProcessTypes;
      //
      //   return MaterialPageRoute(
      //     builder: (context) => AgreementDetailAddedView(
      //       signProcessTypes: signProcessTypes,
      //     ),
      //     settings: settings,
      //   );
      //
      // /// AddFieldsInDocumentView
      // case Routes.ADD_FIELDS_IN_DOCUMENT:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   final signProcessTypes = args['signProcessTypes'] as SignProcessTypes;
      //
      //   return MaterialPageRoute(
      //     builder: (context) => AddFieldsInDocumentView(
      //       signProcessTypes: signProcessTypes,
      //     ),
      //     settings: settings,
      //   );

      /// SignatureManagerView
      case Routes.SIGNATURE_MANAGER:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignatureManagerBloc(),
            child: const SignatureManagerView(),
          ),
          settings: settings,
        );

      /// InitialsManagerView
      case Routes.INITIALS_MANAGER:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => InitialsManagerBloc(),
            child: const InitialsManagerView(),
          ),
          settings: settings,
        );

      /// SettingsView
      case Routes.SETTINGS:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SettingsBloc(),
            child: const SettingsView(),
          ),
          settings: settings,
        );

      /// FoldersView
      case Routes.FOLDERS:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<FoldersBloc>(),
            child: const FoldersView(),
          ),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
