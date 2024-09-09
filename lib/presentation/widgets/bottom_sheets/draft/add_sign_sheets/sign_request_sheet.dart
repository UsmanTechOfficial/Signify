// import 'package:dyno_sign/domain/consts/styles.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../assets_gen/assets.gen.dart';
// import '../../../../../domain/consts/font_size.dart';
// import '../../../text/custom_text.dart';
// import '../base_bottom_sheet.dart';
// import '../req_sign/add_doc_sheet.dart';
// import '../sign_docs/sign_docs_sheet.dart';
//
// class SignRequestSheet extends StatelessWidget with BaseBottomSheet {
//   const SignRequestSheet({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SignRequestSheetBuilder(
//           title: "Request Signatures",
//           subtitle: "Request anyone to add signatures in your document",
//           onTap: () {
//             Navigator.of(context).pop(); // Close the current bottom sheet
//             baseBottomSheet(
//               context,
//               title: 'Add a document',
//               content: const AddDocumentSheet(),
//             );
//           },
//         ),
//         SignRequestSheetBuilder(
//           title: "Sign Documents",
//           subtitle:
//               "Documents that you want to sign for yourself or sent by others",
//           onTap: () {
//             Navigator.of(context).pop(); // Close the current bottom sheet
//             baseBottomSheet(
//               context,
//               title: 'Sign',
//               content: const SignDocsSheet(),
//             );
//           },
//         ),
//         SignRequestSheetBuilder(
//           title: "Add Templates",
//           subtitle: "Make templates and use them again and again.",
//           onTap: () {
//             Navigator.of(context).pop(); // Close the current bottom sheet
//             baseBottomSheet(context,
//                 title: 'Add Templates', content: const SizedBox()
//                 // content: const AddTemplatesSheet(),
//                 );
//           },
//         ),
//       ],
//     );
//   }
// }
//
// class SignRequestSheetBuilder extends StatelessWidget {
//   final bool isSelected;
//   final String title;
//   final String subtitle;
//   final Widget? icon;
//   final VoidCallback onTap;
//
//   const SignRequestSheetBuilder({
//     super.key,
//     this.isSelected = false,
//     required this.title,
//     required this.subtitle,
//     this.icon,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//
//     return SizedBox(
//       height: 100,
//       child: Card(
//         shadowColor: isSelected ? colorScheme.primary : colorScheme.shadow,
//         elevation: 4,
//         color: isSelected ? colorScheme.primary : colorScheme.surface,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(AppStyle.tileBorderRadius),
//           onTap: onTap,
//           child: Center(
//             child: ListTile(
//               leading: CircleAvatar(
//                 child: Assets.icons.docIcon.svg(),
//               ),
//               title: CustomText(
//                 title,
//                 color: isSelected ? colorScheme.surface : null,
//                 fontSize: AppFontSize.titleXSmallFont,
//                 fontWeight: FontWeight.w600,
//               ),
//               subtitle: CustomText(
//                 subtitle,
//                 color: colorScheme.outline,
//                 fontSize: AppFontSize.labelSmallFont,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
