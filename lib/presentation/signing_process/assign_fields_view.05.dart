// import 'package:dyno_sign_app/presentation/dashboard/views/home_view.dart';
// import 'package:dyno_sign_app/presentation/request_signatures/controllers/request_signatures.controller.dart';
// import 'package:dyno_sign_app/presentation/request_signatures/views/email_detail_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../domain/constants/app_const.dart';
// import '../../../domain/constants/global_var.dart';
// import '../../../infrastructure/theme/font_size.dart';
// import '../../widgets/button/custom_outlined_button.dart';
// import '../../widgets/custom_text.dart';
//
// class AssignFieldsView extends GetView<RequestSignaturesController> {
//   const AssignFieldsView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Agreement Detail'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(right: mWidth(context) * 0.05),
//               child: Align(
//                 alignment: Alignment.centerRight,
//                 child: CustomOutlinedButton(
//                   onPressed: () {
//                     Get.to(() => const EmailDetailView());
//                   },
//                   text: 'Next',
//                   borderRadius: AppConst.outlinedBtnRadius,
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Padding(
//                 padding:
//                     EdgeInsets.symmetric(horizontal: mWidth(context) * .05),
//                 child: const CText(
//                   "Attached Documents",
//                   size: AppFontSize.titleXSmallFont,
//                   weight: FontWeight.w500,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 180,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 10, // Number of items
//                 itemBuilder: (context, index) {
//                   return SizedBox(
//                     width: 160,
//                     child: DocCard(
//                       isSelected: index.isOdd,
//                       child: Container(
//                         color: colorScheme(context).primaryContainer,
//                       ),
//                       onTap: () {},
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 50),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Padding(
//                 padding:
//                     EdgeInsets.symmetric(horizontal: mWidth(context) * .05),
//                 child: const CText(
//                   "Selected Documents",
//                   size: AppFontSize.titleXSmallFont,
//                   weight: FontWeight.w500,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: mHeight(context) * .7,
//               width: mWidth(context) * .95,
//               child: Card(
//                 elevation: 6,
//                 color: colorScheme(context).outlineVariant,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(
//                     AppConst.borderRadius,
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: 100,
//         width: double.maxFinite,
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//                 color: colorScheme(context).outlineVariant.withOpacity(0.5),
//                 offset: const Offset(0, -4),
//                 blurRadius: 10)
//           ],
//           color: colorScheme(context).surface,
//           borderRadius: const BorderRadius.only(
//             topRight: Radius.circular(AppConst.sheetRadius),
//             topLeft: Radius.circular(AppConst.sheetRadius),
//           ),
//         ),
//         child: const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               CText(
//                 "Add Field",
//                 size: AppFontSize.titleSmallFont,
//                 weight: FontWeight.w500,
//               ),
//               Expanded(
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     BottomField(label: 'Signature', icon: Icons.edit),
//                     BottomField(
//                       label: 'Initials',
//                       icon: Icons.wordpress,
//                       color: Colors.pinkAccent,
//                     ),
//                     BottomField(
//                       label: 'Date',
//                       icon: Icons.calendar_month,
//                       color: Colors.orange,
//                     ),
//                     BottomField(
//                       label: 'Text Field',
//                       icon: Icons.text_fields,
//                       color: Colors.green,
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class BottomField extends StatelessWidget {
//   final IconData icon;
//   final Color? color;
//   final String label;
//
//   const BottomField(
//       {super.key, required this.icon, this.color, required this.label});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 40,
//           width: 40,
//           child: Card(
//             shape: RoundedRectangleBorder(
//                 borderRadius:
//                     BorderRadius.circular(AppConst.outlinedBtnRadius)),
//             elevation: 4,
//             shadowColor: colorScheme(context).outlineVariant,
//             child: Icon(icon,
//                     color: color ?? colorScheme(context).primary, size: 25)
//                 .paddingAll(2),
//           ),
//         ),
//         CText(
//           label,
//           size: AppFontSize.labelSmallFont,
//           weight: FontWeight.w500,
//         )
//       ],
//     );
//   }
// }
