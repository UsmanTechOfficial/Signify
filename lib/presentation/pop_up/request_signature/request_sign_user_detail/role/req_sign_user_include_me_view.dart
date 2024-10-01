// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../../domain/consts/app_consts/signed_user_status.dart';
// import '../../../../../domain/consts/consts.dart';
// import '../../../../../infrastructure/dal/models/api_models/document_user_model.dart';
// import '../../../../../infrastructure/navigation/app_routes/navigation.dart';
// import '../../../../widgets/widgets.dart';
// import '../../../widgets/recipient_card.dart';
// import '../bloc/req_sign_user_detail_bloc.dart';
//
// class ReqSignUserIncludeMeView extends StatelessWidget {
//   const ReqSignUserIncludeMeView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final bloc = context.read<ReqSignUserDetailBloc>();
//     final width = appWidth(context);
//     // final color = appColorScheme(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Agreement Detail'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: width * .05),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: CustomOutlinedTextButton(
//                   onPressed: () {
//                     // Go.to(const ReqSignAssignFieldsView());
//                   },
//                   text: 'Next',
//                   borderRadius: AppStyle.outlinedBtnRadius,
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Set Signing Order with switch
//               ListTile(
//                 contentPadding: EdgeInsets.zero,
//                 title: const CustomText(
//                   "Set Signing Order",
//                   fontSize: AppFontSize.bodyMediumFont,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 trailing: Transform.scale(
//                   scale: 0.8,
//                   child: BlocBuilder<ReqSignUserDetailBloc, ReqSignUserDetailState>(
//                     builder: (context, state) {
//                       if (state is UserChangedState) {
//                         return Switch.adaptive(
//                           value: state.order,
//                           onChanged: (value) {
//                             bloc.add(UserOrderEvent(value));
//                           },
//                         );
//                       }
//
//                       return Switch.adaptive(
//                         value: false,
//                         onChanged: (value) {
//                           bloc.add(UserOrderEvent(value));
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Recipients List
//               const CustomText(
//                 "Recipients List",
//                 fontSize: AppFontSize.titleMSmallFont,
//                 fontWeight: FontWeight.w600,
//               ),
//               const SizedBox(height: 10),
//
//               BlocBuilder<ReqSignUserDetailBloc, ReqSignUserDetailState>(
//                 bloc: bloc,
//                 builder: (context, state) {
//                   if (state is UserChangedState) {
//                     return ListView.builder(
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: state.signedUser.length,
//                       itemBuilder: (context, index) {
//                         return RecipientCard(
//                           order: state.order,
//                           name: state.signedUser[index].firstName,
//                           email: state.signedUser[index].email,
//                           status: state.signedUser[index].status,
//                           index: index + 1,
//                           isMe: false,
//                           onSelected: (value) {
//                             if (value == 0) {
//                               bloc.add(RemoveUserEvent(index));
//                             }
//                           },
//                         );
//                       },
//                     );
//                   }
//                   return const CustomText(
//                     'No recipient added yet',
//                     textAlign: TextAlign.center,
//                     fontSize: AppFontSize.labelMediumFont,
//                   );
//                 },
//               ),
//               const SizedBox(height: 20),
//               // Button to add another recipient
//               CustomElevatedTextButton(
//                 width: double.maxFinite,
//                 text: "Add Recipient",
//                 borderRadius: AppStyle.buttonBorderRadius,
//                 onPressed: () {
//                   // bloc.add(const AddNewRecipientEvent(['Amir']));
//                   _showAdaptiveDialog(
//                     context,
//                     bloc,
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// _showAdaptiveDialog(BuildContext context, ReqSignUserDetailBloc bloc) {
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//
//   FocusNode firstNameFocus = FocusNode();
//   FocusNode emailFocus = FocusNode();
//   FocusNode dropDownFocus = FocusNode();
//
//   final formKey = GlobalKey<FormState>();
//   final width = appWidth(context);
//
//   return showGeneralDialog(
//     context: context,
//     transitionBuilder: (BuildContext context, Animation<double> animation,
//         Animation<double> secondaryAnimation, Widget child) {
//       return SlideTransition(
//         position: Tween<Offset>(
//           begin: const Offset(0, 1),
//           end: Offset.zero,
//         ).animate(animation),
//         child: child,
//       );
//     },
//     pageBuilder: (context, a, b) {
//       return Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           title: CustomText('Add New User'),
//         ),
//         body: Center(
//           child: Form(
//             key: formKey,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: width * .05),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const CustomText(
//                     'Enter Name',
//                     fontSize: AppFontSize.titleXSmallFont,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   const SizedBox(height: 5),
//                   CustomTextFormField(
//                     controller: firstNameController,
//                     hint: "Enter first name",
//                     borderColor: Theme.of(context).colorScheme.outlineVariant,
//                     borderRadius: AppStyle.buttonBorderRadius,
//                     focusNode: firstNameFocus,
//                     autofillHints: [AutofillHints.name],
//                     keyboardType: TextInputType.name,
//                     textInputAction: TextInputAction.next,
//                     onFieldSubmitted: (value) {
//                       FocusScope.of(context).requestFocus(emailFocus);
//                     },
//                     validator: (_) {
//                       return Validation.validate(firstNameController, 'Name');
//                     },
//                   ),
//                   const SizedBox(height: 30),
//                   const CustomText(
//                     'Enter Email',
//                     fontSize: AppFontSize.titleXSmallFont,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   const SizedBox(height: 5),
//                   CustomTextFormField(
//                     controller: emailController,
//                     hint: "Enter email address",
//                     borderColor: Theme.of(context).colorScheme.outlineVariant,
//                     borderRadius: AppStyle.buttonBorderRadius,
//                     focusNode: emailFocus,
//                     autofillHints: [AutofillHints.email],
//                     keyboardType: TextInputType.emailAddress,
//                     textInputAction: TextInputAction.next,
//                     onFieldSubmitted: (value) {
//                       FocusScope.of(context).requestFocus(dropDownFocus);
//                     },
//                     validator: (_) {
//                       return Validation.emailValidation(emailController);
//                     },
//                   ),
//                   // const SizedBox(height: 30),
//                   // const CustomText(
//                   //   'Status',
//                   //   fontSize: AppFontSize.titleXSmallFont,
//                   //   fontWeight: FontWeight.w500,
//                   // ),
//                   // const SizedBox(height: 5),
//                   // DropdownButtonFormField<SignedUserStatus>(
//                   //   value: selectedStatus,
//                   //   focusNode: dropDownFocus,
//                   //   hint: CustomText('Select user status'),
//                   //   items: SignedUserStatus.values.map((SignedUserStatus status) {
//                   //     return DropdownMenuItem<SignedUserStatus>(
//                   //       value: status,
//                   //       child: Text(status.status),
//                   //     );
//                   //   }).toList(),
//                   //   validator: (value) {
//                   //     return Validation.dropDownValidation(value?.status ?? '');
//                   //   },
//                   //   onSaved: (newValue) {
//                   //     selectedStatus = newValue!;
//                   //     FocusScope.of(context).unfocus();
//                   //   },
//                   //   onChanged: (SignedUserStatus? newValue) {
//                   //     selectedStatus = newValue ?? selectedStatus;
//                   //   },
//                   // ),
//                   const SizedBox(height: 40),
//                   CustomElevatedTextButton(
//                     width: double.maxFinite,
//                     text: 'Save',
//                     onPressed: () {
//                       if (formKey.currentState!.validate()) {
//                         final currentState = bloc.state is UserChangedState
//                             ? bloc.state as UserChangedState
//                             : const UserChangedState([], false);
//
//                         final model = DocumentUserModel(
//                             email: 'amir@gmail.com',
//                             firstName: 'amir',
//                             signingOrder: currentState.signedUser.length + 1,
//                             status: SignedUserStatus.needTOSign.status);
//
//                         bloc.add(AddNewSingedUserEvent(model));
//                         Go.back();
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }
