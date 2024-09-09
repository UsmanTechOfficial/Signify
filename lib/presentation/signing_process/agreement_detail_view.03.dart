// import 'package:flutter/material.dart';
//
// class AgreementDetailAddedView extends StatelessWidget {
//   const AgreementDetailAddedView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Agreement Detail'),
//           centerTitle: true,
//         ),
//         body: const Padding(
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
//                         Get.to(() => const RecipientsDetailAddedView()),
//                     text: 'Next',
//                     borderRadius: AppConst.outlinedBtnRadius,
//                   ),
//                 ),
//                 const CText(
//                   "Agreement Details",
//                   size: AppFontSize.titleXSmallFont,
//                   weight: FontWeight.w500,
//                 ),
//                 const SizedBox(height: 20),
//                 const CText(
//                   'Enter Agreement Name',
//                   size: AppFontSize.titleXSmallFont,
//                   weight: FontWeight.w500,
//                 ),
//                 const SizedBox(height: 5),
//                 CustomTextFormField(
//                     hint: "Enter Agreement Name",
//                     controller: TextEditingController(),
//                     borderColor: colorScheme(context).outlineVariant,
//                     borderRadius: AppConst.borderRadius,
//                     onFieldSubmitted: (value) => {},
//                     maxLines: 2,
//                     focusNode: FocusNode()),
//                 const SizedBox(height: 20),
//                 const CText(
//                   'Enter Description',
//                   size: AppFontSize.titleXSmallFont,
//                   weight: FontWeight.w500,
//                 ),
//                 const SizedBox(height: 5),
//                 CustomTextFormField(
//                     hint: "Write Description here",
//                     controller: TextEditingController(),
//                     borderColor: colorScheme(context).outlineVariant,
//                     borderRadius: AppConst.borderRadius,
//                     onFieldSubmitted: (value) => {},
//                     maxLines: 5,
//                     focusNode: FocusNode()),
//                 const SizedBox(height: 30),
//                 const CText(
//                   'Role',
//                   size: AppFontSize.titleXSmallFont,
//                   weight: FontWeight.w500,
//                 ),
//                 const SizedBox(height: 10),
//                 SizedBox(
//                   height: 150,
//                   child: Obx(() {
//                     return ListView.builder(
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: controller.radioBtn.length,
//                       itemBuilder: (context, index) {
//                         return SizedBox(
//                           height: 30,
//                           child: ListTile(
//                             leading: Radio<int>(
//                               value: index,
//                               groupValue: controller.selectedValue.value,
//                               onChanged: (value) {
//                                 if (value != null) {
//                                   controller.selectValue(value);
//                                 }
//                               },
//                             ),
//                             title: CText(
//                               controller.radioBtn[index],
//                               size: AppFontSize.labelMediumFont,
//                               weight: FontWeight.w400,
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }),
//                 ),
//                 const CText(
//                   "Recipient",
//                   size: AppFontSize.titleXSmallFont,
//                   weight: FontWeight.w500,
//                 ),
//                 const SizedBox(height: 20),
//                 const CText(
//                   'Recipient Name',
//                   size: AppFontSize.titleXSmallFont,
//                   weight: FontWeight.w500,
//                 ),
//                 const SizedBox(height: 5),
//                 CustomTextFormField(
//                     hint: "Enter Name",
//                     controller: TextEditingController(),
//                     borderColor: colorScheme(context).outlineVariant,
//                     borderRadius: AppConst.borderRadius,
//                     onFieldSubmitted: (value) => {},
//                     focusNode: FocusNode()),
//                 const SizedBox(height: 20),
//                 const CText(
//                   'Recipient Email',
//                   size: AppFontSize.titleXSmallFont,
//                   weight: FontWeight.w500,
//                 ),
//                 const SizedBox(height: 5),
//                 CustomTextFormField(
//                     hint: "Enter email",
//                     controller: TextEditingController(),
//                     borderColor: colorScheme(context).outlineVariant,
//                     borderRadius: AppConst.borderRadius,
//                     onFieldSubmitted: (value) => {},
//                     focusNode: FocusNode()),
//                 const SizedBox(height: 40),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 20.0),
//                   child: CustomFilledButton(
//                     width: double.maxFinite,
//                     "Get Started",
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
