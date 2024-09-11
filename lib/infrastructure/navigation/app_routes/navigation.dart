import 'package:dyno_sign/presentation/signing_process/bloc/signing_process_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/consts/consts.dart';
import '../../../presentation/blocs.dart';
import '../../../presentation/screens.dart';
import '../../../presentation/signing_process/selected_document_view.02.dart';
import 'routes.dart';

class Go {
  static Future<void> toNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamed(
          routeName,
          arguments: arguments,
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

  static Future<void> offAllToNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
          routeName,
          (Route<dynamic> route) => false,
          arguments: arguments,
        ) ??
        Future.value();
  }

  static back() {
    navigatorKey.currentState?.pop();
  }

// static MaterialPageRoute<T> to<T>({
//   required Bloc<dynamic, dynamic> bloc,
//   required Widget view,
// }) {
//   return MaterialPageRoute(
//     builder: (context) => BlocProvider.value(
//       value: bloc,
//       child: view,
//     ),
//   );
// }
}

class AppPages {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.DASHBOARD:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<DashboardBloc>(),
                  child: const DashboardView(),
                ),
            settings: settings);
      case Routes.ONBOARDING:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => OnboardingBloc(),
                  child: const GetStartedView(),
                ),
            settings: settings);
      case Routes.REQUEST_SIGNATURE:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => RequestSignaturesBloc(),
                  child: const RequestSignaturesView(),
                ),
            settings: settings);
      case Routes.SPLASH:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SplashBloc(),
                  child: const SplashView(),
                ),
            settings: settings);
      case Routes.LOGIN:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => LoginBloc(),
                  child: const LoginView(),
                ),
            settings: settings);
      case Routes.SIGNUP:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SignupBloc(),
                  child: const SignupView(),
                ),
            settings: settings);
      case Routes.FORGET_PASSWORD:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ForgetPasswordBloc(),
                  child: const ForgetPasswordView(),
                ),
            settings: settings);
      case Routes.SELECTED_DOCUMENT:
        return MaterialPageRoute(
          builder: (context) => DocumentSelectedView(
            signingCubit: settings.arguments as SigningProcessCubit,
          ),
          settings: settings,
        );
      // case Routes.DOCUMENT_PREVIEW:
      //   return MaterialPageRoute(
      //     builder: (context) => DocumentPreviewView(
      //       cubit: settings.arguments as SigningProcessCubit,
      //     ),
      //     settings: settings,
      //   );
      case Routes.EMAIL_DETAIL_VIEW:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => EmailDetailViewBloc(),
                  child: const EmailDetailView(),
                ),
            settings: settings);
      case Routes.RECIPIENTS_DETAIL:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => RecipientsDetailBloc(),
                  child: const RecipientsDetailView(),
                ),
            settings: settings);
      case Routes.ASSIGN_FIELDS:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AssignFieldsBloc(),
                  child: const AssignFieldsView(),
                ),
            settings: settings);
      case Routes.AGREEMENT_OVERVIEW:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AgreementOverviewBloc(),
                  child: const AgreementOverviewView(),
                ),
            settings: settings);
      case Routes.AGREEMENT_DETAIL_ADDED:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AgreementDetailAddedBloc(),
                  child: const AgreementDetailAddedView(),
                ),
            settings: settings);
      case Routes.ADD_SIGNATURE:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SignatureManagerBloc(),
                  child: const SignatureManagerView(),
                ),
            settings: settings);
      case Routes.SETTINGS:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SettingsBloc(),
                  child: const SettingsView(),
                ),
            settings: settings);
      case Routes.FOLDERS:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => FoldersBloc(),
                  child: const FoldersView(),
                ),
            settings: settings);
      default:
        return null;
    }
  }
}
