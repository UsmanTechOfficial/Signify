// import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
// import 'package:dyno_sign/infrastructure/navigation/app_routes/routes.dart';
// import 'package:dyno_sign/presentation/request_signature/views/selected_document/bloc/selected_document_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../domain/consts/font_size.dart';
// import '../../../../domain/consts/styles.dart';
// import '../../../widgets/buttons/custom_elevated_text_button.dart';
// import '../../../widgets/buttons/custom_outlined_text_button.dart';
// import '../../../widgets/text/custom_text.dart';
// import 'bloc/selected_document_bloc.dart';
// import 'bloc/selected_document_event.dart';
//
// class DocumentSelectedView extends StatelessWidget {
//   const DocumentSelectedView({super.key});
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
//           scrollDirection: Axis.vertical,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: CustomOutlinedTextButton(
//                   onPressed: () {
//                     Go.toNamed(Routes.AGREEMENT_DETAIL_ADDED);
//                   },
//                   text: 'Next',
//                   borderRadius: AppStyle.outlinedBtnRadius,
//                 ),
//               ),
//               const CustomText(
//                 "Attached Documents",
//                 fontSize: AppFontSize.titleXSmallFont,
//                 fontWeight: FontWeight.w500,
//               ),
//               BlocBuilder<SelectedDocumentBloc, SelectedDocumentState>(
//                 builder: (context, state) {
//                   return ListView.builder(
//                     physics: const NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: state.loadedFiles.length,
//                     itemBuilder: (context, index) {
//                       final file = state.loadedFiles[index];
//                       return Card(
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: ListTile(
//                                 leading: const CircleAvatar(
//                                   child: Icon(Icons.picture_as_pdf), // Placeholder for your icon
//                                 ),
//                                 title: CustomText(
//                                   file.name,
//                                   fontSize: AppFontSize.titleXSmallFont,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                                 subtitle: CustomText(
//                                   state.filesDate[index].toString(),
//                                   fontSize: AppFontSize.labelSmallFont,
//                                   color: Theme.of(context).colorScheme.outline,
//                                 ),
//                               ),
//                             ),
//                             PopupMenuButton(
//                               icon: const Icon(Icons.more_vert_rounded),
//                               onSelected: (value) {
//                                 if (value == 0) {
//                                   context.read<SelectedDocumentBloc>().add(RemoveFile(index));
//                                 }
//                               },
//                               itemBuilder: (BuildContext context) => [
//                                 const PopupMenuItem<int>(
//                                   value: 0,
//                                   child: Text('Delete'),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 20.0),
//                 child: CustomElevatedTextButton(
//                   width: double.maxFinite,
//                   text: "Add another document",
//                   borderRadius: AppStyle.buttonBorderRadius,
//                   onPressed: () {
//                     context.read<SelectedDocumentBloc>().selectFile();
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
