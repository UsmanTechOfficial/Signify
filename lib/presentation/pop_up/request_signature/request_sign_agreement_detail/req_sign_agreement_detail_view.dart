import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/consts/consts.dart';
import '../../../widgets/widgets.dart';
import 'bloc/req_sign_agreement_detail_bloc.dart';

class ReqSignAgreementDetailView extends StatelessWidget {
  const ReqSignAgreementDetailView({super.key, required});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ReqSignAgreementDetailBloc>();


    return Scaffold(
      appBar: AppBar(
        title: const Text('Agreement Detail'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .05),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: CustomOutlinedTextButton(
                  onPressed: () {
                    final currentState = bloc.state;

                    final selectedRole = (currentState is RecipientRoleState)
                        ? currentState.selectedRole
                        : RecipientUserRole.addRecipient;

                    // Trigger the navigation event with the selected role
                    bloc.add(NextNavigateEvent(selectedRole));

                  },
                  text: 'Next',
                  borderRadius: AppStyle.outlinedBtnRadius,
                ),
              ),
              const CustomText(
                "Agreement Details",
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 20),
              const CustomText(
                'Enter Agreement Name',
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 5),
              CustomTextFormField(
                controller: bloc.agreementNameController,
                hint: "Enter Agreement Name",
                textInputAction: TextInputAction.next,
                borderColor: Theme.of(context).colorScheme.outlineVariant,
                borderRadius: AppStyle.buttonBorderRadius,
                focusNode: bloc.agreementNameFocus,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(bloc.descriptionFocus);
                },
                maxLines: 2,

              ),
              const SizedBox(height: 20),
              const CustomText(
                'Enter Description',
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 5),
              CustomTextFormField(
                controller: bloc.descriptionController,
                hint: "Write Description here",
                borderColor: Theme.of(context).colorScheme.outlineVariant,
                borderRadius: AppStyle.buttonBorderRadius,
                focusNode: bloc.descriptionFocus,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).unfocus();
                },
                maxLines: 5,

              ),
              const SizedBox(height: 30),
              const CustomText(
                'Role',
                fontSize: AppFontSize.titleXSmallFont,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 10),
              BlocBuilder<ReqSignAgreementDetailBloc, ReqSignAgreementDetailState>(
                buildWhen: (_, current) => current is RecipientRoleState,
                builder: (context, state) {
                  if(state is RecipientRoleState){
                  return SizedBox(
                    height: 150,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: RecipientUserRole.values.length,
                      itemBuilder: (context, index) {
                        final role = RecipientUserRole.values[index];
                        return SizedBox(
                          height: 30,
                          child: ListTile(
                            leading: Radio<RecipientUserRole>(
                              value: role,
                              groupValue: state.selectedRole,
                              onChanged: (RecipientUserRole? role) {
                                if (role != null) {
                                  bloc.add(RecipientRoleChangedEvent(role));
                                }
                              },
                            ),
                            title: CustomText(
                              role.role, // Display role name from enum
                              fontSize: AppFontSize.labelMediumFont,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                  } else{
                    return SizedBox(
                      height: 150,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: RecipientUserRole.values.length,
                        itemBuilder: (context, index) {
                          final role = RecipientUserRole.values[index];
                          return SizedBox(
                            height: 30,
                            child: ListTile(
                              leading: Radio<RecipientUserRole>(
                                value: role,
                                groupValue: RecipientUserRole.addRecipient,
                                onChanged: (RecipientUserRole? role) {
                                  if (role != null) {
                                    bloc.add(RecipientRoleChangedEvent(role));
                                  }
                                },
                              ),
                              title: CustomText(
                                role.role, // Display role name from enum
                                fontSize: AppFontSize.labelMediumFont,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              // const CustomText(
              //   "Recipient",
              //   fontSize: AppFontSize.titleXSmallFont,
              //   fontWeight: FontWeight.w600,
              // ),
              // const SizedBox(height: 20),
              // const CustomText(
              //   'Recipient Name',
              //   fontSize: AppFontSize.titleXSmallFont,
              //   fontWeight: FontWeight.w500,
              // ),
              // const SizedBox(height: 5),
              // CustomTextFormField(
              //   controller: bloc.recipientNameController,
              //   hint: "Enter Name",
              //   borderColor: Theme.of(context).colorScheme.outlineVariant,
              //   borderRadius: AppStyle.buttonBorderRadius,
              //   onFieldSubmitted: (value) {},
              //   focusNode: FocusNode(),
              // ),
              // const SizedBox(height: 20),
              // const CustomText(
              //   'Recipient Email',
              //   fontSize: AppFontSize.titleXSmallFont,
              //   fontWeight: FontWeight.w500,
              // ),
              // const SizedBox(height: 5),
              // CustomTextFormField(
              //   controller: bloc.recipientEmailController,
              //   hint: "Enter email",
              //   borderColor: Theme.of(context).colorScheme.outlineVariant,
              //   borderRadius: AppStyle.buttonBorderRadius,
              //   onFieldSubmitted: (value) {},
              //   focusNode: FocusNode(),
              // ),
              // const SizedBox(height: 40),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 20.0),
              //   child: CustomElevatedTextButton(
              //     width: double.maxFinite,
              //     text: "Get Started",
              //     borderRadius: AppStyle.buttonBorderRadius,
              //     onPressed: () {
              //       // Handle the submission
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
