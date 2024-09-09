// import 'package:dyno_sign_app/domain/constants/app_const.dart';
// import 'package:dyno_sign_app/domain/constants/global_var.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../infrastructure/theme/font_size.dart';
// import '../../dashboard/views/home_view.dart';
// import '../../widgets/custom_text.dart';
//
// class AgreementOverviewView extends GetView {
//   const AgreementOverviewView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Agreement Detail'),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: mWidth(context) * 0.05),
//         child: CustomScrollView(
//           slivers: [
//             SliverToBoxAdapter(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const CText(
//                     "Name",
//                     size: AppFontSize.titleSmallFont,
//                     weight: FontWeight.w500,
//                   ),
//                   CText(
//                     "Agreement 1",
//                     size: AppFontSize.labelMediumFont,
//                     color: colorScheme(context).outline,
//                   ),
//                   const CText(
//                     "Description",
//                     size: AppFontSize.titleSmallFont,
//                     weight: FontWeight.w500,
//                   ),
//                   CText(
//                     "Your data's security is our top priority. Controlly offers robust security measures to protect your information.",
//                     size: AppFontSize.labelMediumFont,
//                     color: colorScheme(context).outline,
//                   ),
//                   const SizedBox(height: 30),
//                   Container(
//                     padding: const EdgeInsets.all(10.0),
//                     height: 160,
//                     width: double.maxFinite,
//                     decoration: BoxDecoration(
//                         color: colorScheme(context).primary,
//                         borderRadius:
//                             BorderRadius.circular(AppConst.borderRadius)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CText(
//                           "Agreement Detail",
//                           size: AppFontSize.titleSmallFont,
//                           color: colorScheme(context).surface,
//                           weight: FontWeight.w600,
//                         ),
//                         Divider(
//                           color: colorScheme(context).surface,
//                           thickness: 1,
//                         ),
//                         const CardTile(title: "Amir Mahmod", label: "Sender"),
//                         const CardTile(
//                             title: "12/04/2024", label: "Created on"),
//                         const CardTile(title: "amir@email.com", label: "Email"),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const CText(
//                         "Attached Documents",
//                         size: AppFontSize.titleSmallFont,
//                         weight: FontWeight.w500,
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         child: CText(
//                           "See all",
//                           size: AppFontSize.labelSmallFont,
//                           weight: FontWeight.w500,
//                           color: colorScheme(context).primary,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SliverGrid.builder(
//               itemCount: 2,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2),
//               itemBuilder: (context, index) {
//                 return DocCard(
//                   isSelected: index.isEven,
//                   child: Container(color: Colors.blue),
//                   onTap: () {},
//                 );
//               },
//             ),
//             const SliverToBoxAdapter(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 20),
//                   CText(
//                     "Recipient List",
//                     size: AppFontSize.titleSmallFont,
//                     weight: FontWeight.w500,
//                   ),
//                 ],
//               ),
//             ),
//             SliverList.builder(
//               itemCount: 2,
//               itemBuilder: (context, index) {
//                 return Card(
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: ListTile(
//                           leading: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               SizedBox(
//                                 width: 50,
//                                 height: 35,
//                                 child: Card(
//                                   color: colorScheme(context).primary,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(
//                                           AppConst.outlinedBtnRadius)),
//                                   child: Center(
//                                     child: CText(
//                                       '${index + 1}',
//                                       align: TextAlign.center,
//                                       weight: FontWeight.w600,
//                                       color: colorScheme(context).surface,
//                                       size: AppFontSize.labelXLargeFont,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               CircleAvatar(
//                                 backgroundColor: index.isEven
//                                     ? colorScheme(context).primary
//                                     : colorScheme(context).primaryContainer,
//                                 child: const CText(
//                                   'A',
//                                   size: AppFontSize.labelMediumFont,
//                                 ), // Placeholder for your icon
//                               ),
//                             ],
//                           ),
//                           title: const CText(
//                             "Amir",
//                             size: AppFontSize.titleXSmallFont,
//                             weight: FontWeight.w500,
//                           ),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CText(
//                                 "amir@email.com",
//                                 // Update this as needed
//                                 size: AppFontSize.labelSmallFont,
//                                 color: colorScheme(context).outline,
//                               ),
//                               CText(
//                                 'Needs to sign',
//                                 // Update this as needed
//                                 size: AppFontSize.labelSmallFont,
//                                 color: colorScheme(context).outline,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       PopupMenuButton(
//                           icon: const Icon(Icons.more_vert_rounded),
//                           onSelected: (value) {
//                             if (value == 0) {
//                               controller.loadedFiles.removeAt(index);
//                             }
//                           },
//                           itemBuilder: (BuildContext context) => [
//                                 const PopupMenuItem<int>(
//                                   value: 0,
//                                   child: Text('Delete'),
//                                 ),
//                               ])
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CardTile extends StatelessWidget {
//   final String label;
//   final String title;
//
//   const CardTile({super.key, required this.title, required this.label});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 30,
//       child: ListTile(
//         dense: true,
//         leading: CText(
//           label,
//           size: AppFontSize.labelSmallFont,
//           color: colorScheme(context).surface,
//         ),
//         title: CText(
//           title,
//           size: AppFontSize.titleSmallFont,
//           color: colorScheme(context).surface,
//         ),
//       ),
//     );
//   }
// }
