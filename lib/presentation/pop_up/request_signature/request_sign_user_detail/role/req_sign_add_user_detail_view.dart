import 'package:dyno_sign/domain/consts/app_consts/signed_user_status.dart';
import 'package:dyno_sign/domain/consts/app_consts/user_type.dart';
import 'package:dyno_sign/infrastructure/dal/models/api_models/document_user_model.dart';
import 'package:dyno_sign/infrastructure/dal/models/api_models/recipinet_model.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/consts/consts.dart';
import '../../../../widgets/widgets.dart';
import '../../../widgets/recipient_card.dart';
import '../bloc/req_sign_user_detail_bloc.dart';

class ReqSignAddUserDetailView extends StatelessWidget {
  const ReqSignAddUserDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ReqSignUserDetailBloc>();
    final width = appWidth(context);
    final color = appColorScheme(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agreement Detail'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .05),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: CustomOutlinedTextButton(
                  onPressed: () {
                    bloc.add(const NextNavigateEvent());
                  },
                  text: 'Next',
                  borderRadius: AppStyle.outlinedBtnRadius,
                ),
              ),
              const SizedBox(height: 20),
              // Set Signing Order with switch
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: const CustomText(
                  "Set Signing Order",
                  fontSize: AppFontSize.bodyMediumFont,
                  fontWeight: FontWeight.w500,
                ),
                trailing: Transform.scale(
                  scale: 0.8,
                  child: BlocBuilder<ReqSignUserDetailBloc, ReqSignUserDetailState>(
                    bloc: bloc,
                    buildWhen: (previous, current) => current is SignerChangedState,
                    builder: (context, state) {
                      if (state is SignerChangedState) {
                        return Switch.adaptive(
                          value: state.order,
                          onChanged: (value) {
                            bloc.add(UserOrderEvent(value));
                          },
                        );
                      }

                      return Switch.adaptive(
                        value: false,
                        onChanged: (value) {
                          bloc.add(UserOrderEvent(value));
                        },
                      );
                    },
                  ),
                ),
              ),

              Row(
                children: [
                  Checkbox.adaptive(
                    value: false,
                    onChanged: (value) {},
                  ),
                  CustomText(
                    'Include me as a signer',
                    fontSize: AppFontSize.labelMediumFont,
                  ),
                ],
              ),

              // Separate BlocBuilder for Signers List
              CustomText(
                "Recipients List",
                fontSize: AppFontSize.titleMSmallFont,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 10),

              BlocBuilder<ReqSignUserDetailBloc, ReqSignUserDetailState>(
                bloc: bloc,
                buildWhen: (previous, current) => current is SignerChangedState,
                builder: (context, state) {
                  if (state is SignerChangedState) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.signedUser.length,
                      itemBuilder: (context, index) {
                        return SignerCard(
                          order: state.order,
                          name: state.signedUser[index].firstName,
                          email: state.signedUser[index].email,
                          status: state.signedUser[index].status,
                          index: index + 1,
                          isMe: false,
                          onSelected: (value) {
                            if (value == 0) {
                              bloc.add(RemoveSignerEvent(index));
                            }
                          },
                        );
                      },
                    );
                  }
                  return CustomText(
                    'No signers included',
                    textAlign: TextAlign.center,
                    color: color.outline,
                    fontSize: AppFontSize.labelMediumFont,
                  );
                },
              ),
              const SizedBox(height: 20),

              CustomElevatedTextButton(
                width: double.maxFinite,
                text: "Add Signer",
                borderRadius: AppStyle.buttonBorderRadius,
                onPressed: () {
                  _showAdaptiveDialog(context, bloc, userType: UserType.signer);
                },
              ),
              const SizedBox(height: 20),

              // Separate BlocBuilder for Viewer List
              CustomText(
                "Viewer List",
                fontSize: AppFontSize.titleMSmallFont,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 10),

              BlocBuilder<ReqSignUserDetailBloc, ReqSignUserDetailState>(
                bloc: bloc,
                buildWhen: (previous, current) => current is ViewerChangedState,
                builder: (context, state) {
                  if (state is ViewerChangedState) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.viewers.length,
                      itemBuilder: (context, index) {
                        return ViewerCard(
                          email: state.viewers[index].email,
                          status: 'only can view',
                          index: index + 1,
                          onSelected: (value) {
                            if (value == 0) {
                              bloc.add(RemoveViewerEvent(index));
                            }
                          },
                        );
                      },
                    );
                  }
                  return CustomText(
                    'No viewer included',
                    textAlign: TextAlign.center,
                    color: color.outline,
                    fontSize: AppFontSize.labelMediumFont,
                  );
                },
              ),
              const SizedBox(height: 10),

              CustomElevatedTextButton(
                width: double.maxFinite,
                text: "Add Viewer",
                borderRadius: AppStyle.buttonBorderRadius,
                onPressed: () {
                  _showAdaptiveDialog(context, bloc, userType: UserType.recipient);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

_showAdaptiveDialog(BuildContext context, ReqSignUserDetailBloc bloc,
    {UserType userType = UserType.signer}) {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  SignedUserStatus selectedStatus = SignedUserStatus.needTOSign;

  FocusNode firstNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode dropDownFocus = FocusNode();

  final formKey = GlobalKey<FormState>();
  final width = appWidth(context);

  return showGeneralDialog(
    context: context,
    transitionBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
    pageBuilder: (context, a, b) {
      if (userType == UserType.signer) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: CustomText('Add New Signer'),
          ),
          body: Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomText(
                      'Enter Name',
                      fontSize: AppFontSize.titleXSmallFont,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 5),
                    CustomTextFormField(
                      controller: firstNameController,
                      hint: "Enter first name",
                      borderColor: Theme.of(context).colorScheme.outlineVariant,
                      borderRadius: AppStyle.buttonBorderRadius,
                      focusNode: firstNameFocus,
                      autofillHints: [AutofillHints.name],
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(emailFocus);
                      },
                      validator: (_) {
                        return Validation.validate(firstNameController, 'Name');
                      },
                    ),
                    const SizedBox(height: 30),
                    const CustomText(
                      'Enter Email',
                      fontSize: AppFontSize.titleXSmallFont,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 5),
                    CustomTextFormField(
                      controller: emailController,
                      hint: "Enter email address",
                      borderColor: Theme.of(context).colorScheme.outlineVariant,
                      borderRadius: AppStyle.buttonBorderRadius,
                      focusNode: emailFocus,
                      autofillHints: [AutofillHints.email],
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(dropDownFocus);
                      },
                      validator: (_) {
                        return Validation.emailValidation(emailController);
                      },
                    ),
                    // const SizedBox(height: 30),
                    // const CustomText(
                    //   'Status',
                    //   fontSize: AppFontSize.titleXSmallFont,
                    //   fontWeight: FontWeight.w500,
                    // ),
                    // const SizedBox(height: 5),
                    // DropdownButtonFormField<SignedUserStatus>(
                    //   value: selectedStatus,
                    //   focusNode: dropDownFocus,
                    //   hint: CustomText('Select user status'),
                    //   items: SignedUserStatus.values.map((SignedUserStatus status) {
                    //     return DropdownMenuItem<SignedUserStatus>(
                    //       value: status,
                    //       child: Text(status.status),
                    //     );
                    //   }).toList(),
                    //   validator: (value) {
                    //     return Validation.dropDownValidation(value?.status ?? '');
                    //   },
                    //   onSaved: (newValue) {
                    //     selectedStatus = newValue!;
                    //     FocusScope.of(context).unfocus();
                    //   },
                    //   onChanged: (SignedUserStatus? newValue) {
                    //     selectedStatus = newValue ?? selectedStatus;
                    //   },
                    // ),
                    const SizedBox(height: 40),
                    CustomElevatedTextButton(
                      width: double.maxFinite,
                      text: 'Save',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final currentState = bloc.state is SignerChangedState
                              ? bloc.state as SignerChangedState
                              : const SignerChangedState([], false);

                          final model = DocumentUserModel(
                              email: emailController.text,
                              firstName: firstNameController.text,
                              signingOrder: currentState.signedUser.length + 1,
                              status: selectedStatus.status);

                          bloc.add(AddNewSingerEvent(model));
                          Go.back();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: CustomText('Add New Viewer'),
          ),
          body: Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomText(
                      'Enter Email',
                      fontSize: AppFontSize.titleXSmallFont,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 5),
                    CustomTextFormField(
                      controller: emailController,
                      hint: "Enter email address",
                      borderColor: Theme.of(context).colorScheme.outlineVariant,
                      borderRadius: AppStyle.buttonBorderRadius,
                      focusNode: emailFocus,
                      autofillHints: [AutofillHints.email],
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).unfocus();
                      },
                      validator: (_) {
                        return Validation.emailValidation(emailController);
                      },
                    ),
                    const SizedBox(height: 40),
                    CustomElevatedTextButton(
                      width: double.maxFinite,
                      text: 'Save',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final model = RecipientModel(email: emailController.text);

                          bloc.add(AddNewViewerEvent(model));
                          Go.back();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    },
  );
}
