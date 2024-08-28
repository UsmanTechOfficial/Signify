// import 'package:dyno_sign_app/presentation/request_signatures/views/agreement_overview_view.dart';
// import 'package:dyno_sign_app/presentation/widgets/text_form_field/custom_textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../domain/constants/app_const.dart';
// import '../../../domain/constants/global_var.dart';
// import '../../../infrastructure/theme/font_size.dart';
// import '../../widgets/button/custom_outlined_button.dart';
// import '../../widgets/custom_text.dart';
// import '../controllers/request_signatures.controller.dart';
//
// class EmailDetailView extends GetView<RequestSignaturesController> {
//   const EmailDetailView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Agreement Detail'),
//           centerTitle: true,
//         ),
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: mWidth(context) * .05),
//           child: SingleChildScrollView(
//             physics: const ClampingScrollPhysics(),
//             scrollDirection: Axis.vertical,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: CustomOutlinedButton(
//                     onPressed: () =>
//                         Get.to(() => const AgreementOverviewView()),
//                     text: 'Send',
//                     borderRadius: AppConst.outlinedBtnRadius,
//                   ),
//                 ),
//                 const CText(
//                   "Email Details",
//                   size: AppFontSize.titleXSmallFont,
//                   weight: FontWeight.w600,
//                 ),
//                 const SizedBox(height: 20),
//                 const CText(
//                   'Enter',
//                   size: AppFontSize.titleXSmallFont,
//                   weight: FontWeight.w500,
//                 ),
//                 const SizedBox(height: 5),
//                 CustomTextFormField(
//                     hint: "Enter email Address",
//                     controller: TextEditingController(),
//                     borderColor: colorScheme(context).outlineVariant,
//                     borderRadius: AppConst.borderRadius,
//                     onFieldSubmitted: (value) => {},
//                     focusNode: FocusNode()),
//                 const SizedBox(height: 20),
//                 const CText(
//                   'Message',
//                   size: AppFontSize.titleXSmallFont,
//                   weight: FontWeight.w500,
//                 ),
//                 const SizedBox(height: 5),
//                 CustomTextFormField(
//                     hint: "Write Message",
//                     controller: TextEditingController(),
//                     borderColor: colorScheme(context).outlineVariant,
//                     borderRadius: AppConst.borderRadius,
//                     onFieldSubmitted: (value) => {},
//                     maxLines: 5,
//                     focusNode: FocusNode()),
//                 const SizedBox(height: 30),
//                 const CText(
//                   "Recipient List",
//                   size: AppFontSize.titleXSmallFont,
//                   weight: FontWeight.w500,
//                 ),
//                 const SizedBox(height: 20),
//                 ListView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: 2,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: ListTile(
//                               leading: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   SizedBox(
//                                     width: 50,
//                                     height: 35,
//                                     child: Card(
//                                       color: colorScheme(context).primary,
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(
//                                               AppConst.outlinedBtnRadius)),
//                                       child: Center(
//                                         child: CText(
//                                           '${index + 1}',
//                                           align: TextAlign.center,
//                                           weight: FontWeight.w600,
//                                           color: colorScheme(context).surface,
//                                           size: AppFontSize.labelXLargeFont,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   CircleAvatar(
//                                     backgroundColor: index.isEven
//                                         ? colorScheme(context).primary
//                                         : colorScheme(context).primaryContainer,
//                                     child: const CText(
//                                       'A',
//                                       size: AppFontSize.labelMediumFont,
//                                     ), // Placeholder for your icon
//                                   ),
//                                 ],
//                               ),
//                               title: const CText(
//                                 "Amir",
//                                 size: AppFontSize.titleXSmallFont,
//                                 weight: FontWeight.w500,
//                               ),
//                               subtitle: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   CText(
//                                     "amir@email.com",
//                                     // Update this as needed
//                                     size: AppFontSize.labelSmallFont,
//                                     color: colorScheme(context).outline,
//                                   ),
//                                   CText(
//                                     'Needs to sign',
//                                     // Update this as needed
//                                     size: AppFontSize.labelSmallFont,
//                                     color: colorScheme(context).outline,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           PopupMenuButton(
//                               icon: const Icon(Icons.more_vert_rounded),
//                               onSelected: (value) {
//                                 if (value == 0) {
//                                   controller.loadedFiles.removeAt(index);
//                                 }
//                               },
//                               itemBuilder: (BuildContext context) => [
//                                     const PopupMenuItem<int>(
//                                       value: 0,
//                                       child: Text('Delete'),
//                                     ),
//                                   ])
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
