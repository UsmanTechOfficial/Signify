// import 'package:dyno_sign_app/domain/constants/app_const.dart';
// import 'package:dyno_sign_app/domain/constants/global_var.dart';
// import 'package:dyno_sign_app/infrastructure/theme/font_size.dart';
// import 'package:dyno_sign_app/presentation/request_signatures/views/assign_fields_view.dart';
// import 'package:dyno_sign_app/presentation/widgets/button/custom_outlined_button.dart';
// import 'package:dyno_sign_app/presentation/widgets/custom_text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../widgets/button/custom_filled_btn.dart';
// import '../controllers/request_signatures.controller.dart';
//
// class RecipientsDetailAddedView extends GetView<RequestSignaturesController> {
//   const RecipientsDetailAddedView({super.key});
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
//             scrollDirection: Axis.vertical,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: CustomOutlinedButton(
//                     onPressed: () => Get.to(() => const AssignFieldsView()),
//                     text: 'Next',
//                     borderRadius: AppConst.outlinedBtnRadius,
//                   ),
//                 ),
//                 const CText(
//                   "Recipients List",
//                   size: AppFontSize.titleXSmallFont,
//                   weight: FontWeight.w500,
//                 ),
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
//                               leading: CircleAvatar(
//                                 backgroundColor: index.isEven
//                                     ? colorScheme(context).primary
//                                     : colorScheme(context).primaryContainer,
//                                 child: const CText(
//                                   'A',
//                                   size: AppFontSize.labelMediumFont,
//                                 ), // Placeholder for your icon
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
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 20.0),
//                   child: CustomFilledButton(
//                     width: double.maxFinite,
//                     "Add Another Recipient",
//                     fontSize: AppFontSize.titleXSmallFont,
//                     borderRadius: AppConst.borderRadius,
//                     onPressed: () {
//                       controller.selectFile();
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }
