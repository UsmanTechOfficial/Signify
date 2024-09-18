// import 'package:dyno_sign/domain/consts/styles.dart';
// import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../domain/consts/font_size.dart';
// import '../../../../infrastructure/navigation/app_routes/routes.dart';
// import '../../../widgets/buttons/custom_elevated_text_button.dart';
// import '../../../widgets/buttons/custom_outlined_text_button.dart';
// import '../../../widgets/form_field/custom_formfield.dart';
// import '../../../widgets/text/custom_text.dart';
// import 'bloc/agreement_detail_added_bloc.dart';
// import 'bloc/agreement_detail_added_event.dart';
// import 'bloc/agreement_detail_added_state.dart';
//
// class AgreementDetailAddedView extends StatelessWidget {
//   const AgreementDetailAddedView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Agreement Detail'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .05),
//         child: SingleChildScrollView(
//           physics: const ClampingScrollPhysics(),
//           scrollDirection: Axis.vertical,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: CustomOutlinedTextButton(
//                   onPressed: () {
//                     Go.toNamed(Routes.RECIPIENTS_DETAIL);
//                   },
//                   text: 'Next',
//                   borderRadius: AppStyle.outlinedBtnRadius,
//                 ),
//               ),
//               const CustomText(
//                 "Agreement Details",
//                 fontSize: AppFontSize.titleXSmallFont,
//                 fontWeight: FontWeight.w500,
//               ),
//               const SizedBox(height: 20),
//               const CustomText(
//                 'Enter Agreement Name',
//                 fontSize: AppFontSize.titleXSmallFont,
//                 fontWeight: FontWeight.w500,
//               ),
//               const SizedBox(height: 5),
//               BlocBuilder<AgreementDetailAddedBloc, AgreementDetailAddedState>(
//                 builder: (context, state) {
//                   return CustomTextFormField(
//                     hint: "Enter Agreement Name",
//                     controller: TextEditingController(text: state.agreementName),
//                     borderColor: Theme.of(context).colorScheme.outlineVariant,
//                     borderRadius: AppStyle.buttonBorderRadius,
//                     onFieldSubmitted: (value) =>
//                         context.read<AgreementDetailAddedBloc>().add(UpdateAgreementName(value)),
//                     maxLines: 2,
//                     focusNode: FocusNode(),
//                   );
//                 },
//               ),
//               const SizedBox(height: 20),
//               const CustomText(
//                 'Enter Description',
//                 fontSize: AppFontSize.titleXSmallFont,
//                 fontWeight: FontWeight.w500,
//               ),
//               const SizedBox(height: 5),
//               BlocBuilder<AgreementDetailAddedBloc, AgreementDetailAddedState>(
//                 builder: (context, state) {
//                   return CustomTextFormField(
//                     hint: "Write Description here",
//                     controller: TextEditingController(text: state.description),
//                     borderColor: Theme.of(context).colorScheme.outlineVariant,
//                     borderRadius: AppStyle.buttonBorderRadius,
//                     onFieldSubmitted: (value) =>
//                         context.read<AgreementDetailAddedBloc>().add(UpdateDescription(value)),
//                     maxLines: 5,
//                     focusNode: FocusNode(),
//                   );
//                 },
//               ),
//               const SizedBox(height: 30),
//               const CustomText(
//                 'Role',
//                 fontSize: AppFontSize.titleXSmallFont,
//                 fontWeight: FontWeight.w500,
//               ),
//               const SizedBox(height: 10),
//               BlocBuilder<AgreementDetailAddedBloc, AgreementDetailAddedState>(
//                 builder: (context, state) {
//                   return SizedBox(
//                     height: 150,
//                     child: ListView.builder(
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: 4, // Assume 4 roles
//                       itemBuilder: (context, index) {
//                         return SizedBox(
//                           height: 30,
//                           child: ListTile(
//                             leading: Radio<int>(
//                               value: index,
//                               groupValue: state.selectedRoleIndex,
//                               onChanged: (value) {
//                                 if (value != null) {
//                                   context.read<AgreementDetailAddedBloc>().add(SelectRole(value));
//                                 }
//                               },
//                             ),
//                             title: CustomText(
//                               "Role ${index + 1}",
//                               // Replace with actual role names
//                               fontSize: AppFontSize.labelMediumFont,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 },
//               ),
//               const CustomText(
//                 "Recipient",
//                 fontSize: AppFontSize.titleXSmallFont,
//                 fontWeight: FontWeight.w500,
//               ),
//               const SizedBox(height: 20),
//               const CustomText(
//                 'Recipient Name',
//                 fontSize: AppFontSize.titleXSmallFont,
//                 fontWeight: FontWeight.w500,
//               ),
//               const SizedBox(height: 5),
//               BlocBuilder<AgreementDetailAddedBloc, AgreementDetailAddedState>(
//                 builder: (context, state) {
//                   return CustomTextFormField(
//                     hint: "Enter Name",
//                     controller: TextEditingController(text: state.recipientName),
//                     borderColor: Theme.of(context).colorScheme.outlineVariant,
//                     borderRadius: AppStyle.buttonBorderRadius,
//                     onFieldSubmitted: (value) =>
//                         context.read<AgreementDetailAddedBloc>().add(UpdateRecipientName(value)),
//                     focusNode: FocusNode(),
//                   );
//                 },
//               ),
//               const SizedBox(height: 20),
//               const CustomText(
//                 'Recipient Email',
//                 fontSize: AppFontSize.titleXSmallFont,
//                 fontWeight: FontWeight.w500,
//               ),
//               const SizedBox(height: 5),
//               BlocBuilder<AgreementDetailAddedBloc, AgreementDetailAddedState>(
//                 builder: (context, state) {
//                   return CustomTextFormField(
//                     hint: "Enter email",
//                     controller: TextEditingController(text: state.recipientEmail),
//                     borderColor: Theme.of(context).colorScheme.outlineVariant,
//                     borderRadius: AppStyle.buttonBorderRadius,
//                     onFieldSubmitted: (value) =>
//                         context.read<AgreementDetailAddedBloc>().add(UpdateRecipientEmail(value)),
//                     focusNode: FocusNode(),
//                   );
//                 },
//               ),
//               const SizedBox(height: 40),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 20.0),
//                 child: CustomElevatedTextButton(
//                   width: double.maxFinite,
//                   text: "Get Started",
//                   borderRadius: AppStyle.buttonBorderRadius,
//                   onPressed: () {
//                     context.read<AgreementDetailAddedBloc>().add(const SubmitAgreement());
//                     // Handle the submission
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
