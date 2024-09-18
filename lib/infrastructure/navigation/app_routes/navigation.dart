import 'package:dyno_sign/presentation/Initials_manager/bloc/initials_manager_bloc.dart';
import 'package:dyno_sign/presentation/Initials_manager/initials_manager_view.dart';
import 'package:dyno_sign/presentation/signing_process/agreements_from_other.dart';
import 'package:dyno_sign/presentation/signing_process/bloc/signing_process_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/consts/app_consts/sign_process_types.dart';
import '../../../domain/consts/consts.dart';
import '../../../presentation/blocs.dart';
import '../../../presentation/screens.dart';
import '../../../presentation/signing_process/agreement_detail_view.03.dart';
import '../../../presentation/signing_process/agreement_overview_view.07.dart';
import '../../../presentation/signing_process/assign_fields_view.05.dart';
import '../../../presentation/signing_process/email_detail_view.06.dart';
import '../../../presentation/signing_process/recipients_detail_view.04.dart';
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
        final args = settings.arguments as Map<String, dynamic>;
        final signingCubit = args['signingCubit'] as SigningProcessCubit;
        final signProcessTypes = args['signProcessTypes'] as SignProcessTypes;

        return MaterialPageRoute(
          builder: (context) => DocumentSelectedView(
            signProcessTypes: signProcessTypes,
            signingCubit: signingCubit,
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
        final args = settings.arguments as Map<String, dynamic>;
        final signProcessTypes = args['signProcessTypes'] as SignProcessTypes;
        return MaterialPageRoute(
          builder: (context) => EmailDetailView(
            signProcessTypes: signProcessTypes,
          ),
          settings: settings,
        );
      case Routes.RECIPIENTS_DETAIL:
        final args = settings.arguments as Map<String, dynamic>;
        final signProcessTypes = args['signProcessTypes'] as SignProcessTypes;
        return MaterialPageRoute(
            builder: (context) => RecipientsDetailView(
                  signProcessTypes: signProcessTypes,
                ));
      case Routes.ASSIGN_FIELDS:
        final args = settings.arguments as Map<String, dynamic>;
        final signProcessTypes = args['signProcessTypes'] as SignProcessTypes;
        return MaterialPageRoute(
          builder: (context) => AssignFieldsView(
            signProcessTypes: signProcessTypes,
          ),
          settings: settings,
        );
      case Routes.AGGREMENTS_FROM_OTHER:
        final args = settings.arguments as Map<String, dynamic>;
        final signProcessTypes = args['signProcessTypes'] as SignProcessTypes;
        return MaterialPageRoute(
          builder: (context) => AgreementsFromOthers(
            signProcessTypes: signProcessTypes,
          ),
          settings: settings,
        );
      case Routes.AGREEMENT_OVERVIEW:
        final args = settings.arguments as Map<String, dynamic>;
        final signProcessTypes = args['signProcessTypes'] as SignProcessTypes;
        return MaterialPageRoute(
          builder: (context) => AgreementOverviewView(
            signProcessTypes: signProcessTypes,
          ),
          settings: settings,
        );
      case Routes.AGREEMENT_DETAIL_ADDED:
        final args = settings.arguments as Map<String, dynamic>;
        final signProcessTypes = args['signProcessTypes'] as SignProcessTypes;
        return MaterialPageRoute(
          builder: (context) => AgreementDetailAddedView(
            signProcessTypes: signProcessTypes,
          ),
          settings: settings,
        );
      case Routes.SIGNATURE_MANAGER:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SignatureManagerBloc(),
                  child: const SignatureManagerView(),
                ),
            settings: settings);
      case Routes.INITIALS_MANAGER:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => InitialsManagerBloc(),
                  child: const InitialsManagerView(),
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
                  create: (context) => getIt<FoldersBloc>(),
                  child: const FoldersView(),
                ),
            settings: settings);
      default:
        return null;
    }
  }
}
