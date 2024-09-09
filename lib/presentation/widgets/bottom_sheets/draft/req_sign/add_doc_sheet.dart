// import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../assets_gen/assets.gen.dart';
// import '../../../../../domain/consts/font_size.dart';
// import '../../../../../infrastructure/navigation/app_routes/routes.dart';
// import '../../../../dashboard/bloc/dashboard_bloc.dart';
// import '../../../text/custom_text.dart';
//
// class AddDocumentSheet extends StatelessWidget {
//   const AddDocumentSheet({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       shrinkWrap: true,
//       itemCount: 8,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 4,
//         mainAxisSpacing: 10,
//         crossAxisSpacing: 10,
//         childAspectRatio: 1.2,
//       ),
//       itemBuilder: (context, index) {
//         final docType = SelectDocTypes.values[index];
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             InkWell(
//               onTap: () {
//                 Go.back();
//                 Go.toNamed(Routes.SELECTED_DOCUMENT);
//               },
//               child: CircleAvatar(
//                 radius: 20, // Constrain the size of the CircleAvatar
//                 child: Assets.icons.docIcon.svg(),
//               ),
//             ),
//             CustomText(
//               docType.name,
//               fontSize: AppFontSize.labelSmallFont,
//               fontWeight: FontWeight.w500,
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
