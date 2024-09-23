import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/add_templates/add_template_detail_bloc.bindings.dart';
import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/add_templates/add_template_email_detail_bloc.bindings.dart';
import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/add_templates/add_template_recipient_detail_bloc.bindings.dart';
import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/add_templates/add_template_selected_doc_bloc.bindings.dart';
import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/add_templates/add_templates_overview_bloc.bindings.dart';
import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/forget_password_bloc.bindings.dart';
import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/login_bloc.bindings.dart';
import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/onboarding_bloc.bindings.dart';
import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/request_signature_bindings/req_sign_assign_fields_bloc.bindings.dart';
import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/send_by_others/by_other_agreement_detail_bloc.bindings.dart';
import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/send_by_others/by_other_agreement_list_bloc.bindings.dart';
import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/sign_doc_for_me/for_me_assign_field_bloc.bindings.dart';
import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/sign_doc_for_me/for_me_selected_doc_bloc.bindings.dart';
import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/signup_bloc.bindings.dart';
import 'package:dyno_sign/infrastructure/navigation/bloc_bindings/bindings/splash_bloc.bindings.dart';

import '../../../domain/core/interfaces/bindings.dart';
import 'bindings/add_templates/add_template_assign_fields_bloc.bindings.dart';
import 'bindings/agreements_bloc.bindings.dart';
import 'bindings/dashboard_bloc.bindings.dart';
import 'bindings/folder_bloc.bindings.dart';
import 'bindings/home_bloc.bindings.dart';
import 'bindings/profile_bloc.bindings.dart';
import 'bindings/request_signature_bindings/req_sign_agreement_detail_bloc.bindings.dart';
import 'bindings/request_signature_bindings/req_sign_email_detail_bloc.bindings.dart';
import 'bindings/request_signature_bindings/req_sign_recipient_detail_bloc.bindings.dart';
import 'bindings/request_signature_bindings/req_sign_selected_doc_bloc.bindings.dart';
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

    /// request sign
    ReqSignSelectedDocBlocBindings(),
    ReqSignEmailDetailBlocBindings(),
    ReqSignRecipientDetailBlocBindings(),
    ReqSignAgreementDetailBlocBindings(),
    ReqSignAssignFieldsBlocBindings(),

    ///sign doc for me
    ForMeSelectedDocBlocBindings(),
    ForMeAssignFieldBlocBindings(),

    /// send by others
    ByOtherAgreementDetailBlocBindings(),
    ByOtherAgreementListBlocBindings(),

    /// add templates
    AddTemplateAssignFieldsBlocBindings(),
    AddTemplateDetailBlocBindings(),
    AddTemplateEmailDetailBlocBindings(),
    AddTemplateRecipientDetailBlocBindings(),
    AddTemplateSelectedDocBlocBindings(),
    AddTemplatesOverviewBlocBindings(),
  ];

  @override
  void dependencies() {
    for (var binding in _blocBindings) {
      binding.dependencies();
    }
  }
}
