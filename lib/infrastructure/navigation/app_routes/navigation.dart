import 'package:dyno_sign/domain/consts/global_var.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages_import.dart';
import 'routes.dart';

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

  static MaterialPageRoute<T> to<T>({
    required Bloc<dynamic, dynamic> bloc,
    required Widget view,
  }) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider.value(
        value: bloc,
        child: view,
      ),
    );
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
            child: const GetStartedView(),
          ),
        );
      case Routes.REQUEST_SIGNATURE:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RequestSignaturesBloc(),
            child: const RequestSignaturesView(),
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
      case Routes.FORGET_PASSWORD:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ForgetPasswordBloc(),
            child: const ForgetPasswordView(),
          ),
        );
      case Routes.SELECTED_DOCUMENT:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SelectedDocumentBloc(),
            child: const DocumentSelectedView(),
          ),
        );
      case Routes.DOCUMENT_PREVIEW:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => DocumentPreviewBloc(),
            child: const DocumentPreviewView(),
          ),
        );
      case Routes.EMAIL_DETAIL_VIEW:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => EmailDetailViewBloc(),
            child: const EmailDetailView(),
          ),
        );
      case Routes.RECIPIENTS_DETAIL:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RecipientsDetailBloc(),
            child: const RecipientsDetailView(),
          ),
        );
      case Routes.ASSIGN_FIELDS:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AssignFieldsBloc(),
            child: const AssignFieldsView(),
          ),
        );
      case Routes.AGREEMENT_OVERVIEW:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AgreementOverviewBloc(),
            child: const AgreementOverviewView(),
          ),
        );
      case Routes.AGREEMENT_DETAIL_ADDED:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AgreementDetailAddedBloc(),
            child: const AgreementDetailAddedView(),
          ),
        );
      case Routes.ADD_SIGNATURE:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AddSignatureBloc(),
            child: const AddSignatureView(),
          ),
        );
      case Routes.SETTINGS:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SettingsBloc(),
            child: const SettingsView(),
          ),
        );
      case Routes.FOLDERS:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => FoldersBloc(),
            child: const FoldersView(),
          ),
        );
      default:
        return null;
    }
  }
}
