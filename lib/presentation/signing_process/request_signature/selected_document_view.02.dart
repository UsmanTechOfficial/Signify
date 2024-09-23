// import 'package:dyno_sign/domain/consts/app_consts/sign_process_types.dart';
// import 'package:dyno_sign/presentation/signing_process/bloc/signing_process_cubit.dart';
// import 'package:dyno_sign/presentation/widgets/dialogs/pdf_preview.dialog.dart';
// import 'package:dyno_sign/presentation/widgets/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../domain/consts/consts.dart';
// import '../../../infrastructure/navigation/app_routes/navigation.dart';
// import '../../../infrastructure/navigation/app_routes/routes.dart';
//
// class DocumentSelectedView extends StatelessWidget {
//   final SignProcessTypes signProcessTypes;
//   final SigningProcessCubit signingCubit;
//
//   const DocumentSelectedView(
//       {super.key, required this.signingCubit, required this.signProcessTypes});
//
//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       onPopInvokedWithResult: (didPop, result) {
//         signingCubit.close();
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Agreement Detail'),
//           centerTitle: true,
//         ),
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: appWidth(context) * .05),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: CustomOutlinedTextButton(
//                     text: 'Next',
//                     onPressed: () {
//                       if (signProcessTypes == SignProcessTypes.requestSignatures) {
//                         Go.toNamed(
//                           Routes.AGREEMENT_DETAIL_ADDED,
//                           arguments: {
//                             'signProcessTypes': SignProcessTypes.requestSignatures,
//                           },
//                         );
//                       }
//                       if (signProcessTypes == SignProcessTypes.onlyForMe) {
//                         Go.toNamed(
//                           Routes.ADD_FIELDS_IN_DOCUMENT,
//                           arguments: {
//                             'signProcessTypes': SignProcessTypes.onlyForMe,
//                           },
//                         );
//                       }
//                     },
//                   ),
//                 ),
//                 const CustomText(
//                   "Attached Documents",
//                   fontSize: AppFontSize.titleXSmallFont,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 BlocBuilder<SigningProcessCubit, SigningProcessState>(
//                   bloc: signingCubit,
//                   buildWhen: (_, current) => current is FileSelectedState,
//                   builder: (context, state) {
//                     if (signingCubit.selectedPdfFileList.isNotEmpty) {
//                       final files = signingCubit.selectedPdfFileList;
//                       return files.isNotEmpty
//                           ? ListView.builder(
//                               shrinkWrap: true,
//                               physics: const NeverScrollableScrollPhysics(),
//                               itemCount: files.length,
//                               itemBuilder: (context, index) {
//                                 return Card(
//                                   elevation: 5,
//                                   margin: const EdgeInsets.symmetric(vertical: 8),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Expanded(
//                                         child: ListTile(
//                                           leading: const CircleAvatar(
//                                             backgroundColor: Colors.redAccent,
//                                             child: Icon(Icons.picture_as_pdf, color: Colors.white),
//                                           ),
//                                           title: CustomText(
//                                             files[index].name,
//                                             fontSize: AppFontSize.titleXSmallFont,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                           subtitle: CustomText(
//                                             files[index].date.toIso8601String(),
//                                             fontSize: AppFontSize.labelSmallFont,
//                                             color: Theme.of(context).colorScheme.outline,
//                                           ),
//                                         ),
//                                       ),
//                                       PopupMenuButton<int>(
//                                         icon: const Icon(Icons.more_vert_rounded),
//                                         onSelected: (value) {
//                                           switch (value) {
//                                             case 0:
//                                               PdfPreviewDialog.show(
//                                                   context: context,
//                                                   previewOnly: true,
//                                                   files[index].xFile,
//                                                   check: (result) {});
//
//                                               break;
//                                             case 1:
//                                               signingCubit.removeFile(index);
//                                               break;
//                                           }
//                                         },
//                                         itemBuilder: (BuildContext context) => const [
//                                           PopupMenuItem(
//                                             value: 0,
//                                             child: Text('Preview'),
//                                           ),
//                                           PopupMenuItem(
//                                             value: 1,
//                                             child: Text('Delete'),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               },
//                             )
//                           : const CustomText('No documents added yet.');
//                     } else {
//                       return const CustomText('No documents added yet.');
//                     }
//                   },
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 20.0),
//                   child: CustomElevatedTextButton(
//                     width: double.infinity,
//                     text: "Add another document",
//                     onPressed: () {
//                       signingCubit.addNewFile();
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
